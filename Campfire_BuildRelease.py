import os
import shutil
import subprocess
import codecs
import requests

translate_file_name_header = 'Campfire_'
langs = [['cs', 'czech'], 
         ['fr', 'french'], 
         ['de', 'german'], 
         ['it', 'italian'], 
         ['ja', 'japanese'], 
         ['pl', 'polish'], 
         ['ru', 'russian'], 
         ['es', 'spanish']]

def yandexTranslateValues(vals, lang_code):
    api_key = open('./yandex_api_secret.txt').read()
    
    return_vals = []
    for val in vals:
        r = requests.get('https://translate.yandex.net/api/v1.5/tr.json/translate?key=' + api_key + '&text=' + val + '&lang=en-' + lang_code)
        rv = r.json()['text'][0]
        print rv.encode('utf8')
        return_vals.append(rv)

    return return_vals


def translateValues(vals, lang_code):
    api_key = open('./google_api_secret.txt').read()
    service = build('translate', 'v2', developerKey=api_key)

    translation_output = (service.translations().list(
      source='en',
      target=lang_code,
      q=vals
      ).execute())

    return translation_output

def generateTranslationFile(keys, vals, lang):
    print("Generating " + lang[1] + " MCM translation file...")
    file_contents = ''
    translated_values_cleaned = []

    translated_values = yandexTranslateValues(vals, lang[0])
    for v in translated_values:
        translated_values_cleaned.append(v.replace('\ N', '\n').replace('\ n', '\n').replace('\n', '\\n'))
    
    with open('./tmp/Data/interface/translations/' + translate_file_name_header + lang[1] + '.txt', mode='wb') as output:
        output.write(codecs.BOM_UTF16_LE)
        for key, value in zip(keys, translated_values_cleaned):
            file_contents += (key + '\t' + value + '\n')
    
        output.write((file_contents.encode('utf-16')))

print " "
print "=============================="
print "|  Campfire Release Builder  |"
print "|            .(              |"
print "|           /%/\             |"
print "|          (%(%))            |"
print "|         .-'..`-.           |"
print "|         `-'.'`-'           |"
print "=============================="
print " "
user_input = raw_input("Enter the release version: ")

os.chdir("..\\")

# Build the temp directory
print "Creating temp directories..."
tempdir = ".\\tmp\\Data\\"
os.makedirs('./tmp/Data/readmes')
os.makedirs('./tmp/Data/Interface/campfire')
os.makedirs('./tmp/Data/Interface/Translations')
os.makedirs('./tmp/Data/meshes/campfire')
os.makedirs('./tmp/Data/meshes/mps')
os.makedirs('./tmp/Data/Scripts/Source')
os.makedirs('./tmp/Data/textures/campfire')

# Copy the project files
print "Copying project files..."
with open("./Campfire/CampfireArchiveManifest.txt") as manifest:
    lines = manifest.readlines()
    for line in lines:
        shutil.copy(".\\Campfire\\" + line.rstrip('\n'), tempdir + line.rstrip('\n'))

# Generate translation files
keys = []
values = []
with open('./Campfire/interface/translations/Campfire_ENGLISH.txt', 'rb') as f:
    contents = f.read()
    decoded_contents = contents.decode('utf-16').encode('utf-8').split('\r\n')
    for line in decoded_contents:
        split_line = line.split('\t')
        keys.append(split_line[0])
        values.append(split_line[1])

for lang in langs:
    generateTranslationFile(keys, values, lang)

# Build the directories
dirname = "./Campfire " + user_input + " Release"
if not os.path.isdir(dirname):
    print "Creating new build..."
    os.mkdir(dirname)
else:
    print "Removing old build of same version..."
    shutil.rmtree(dirname)
    os.mkdir(dirname)

os.mkdir(dirname + "/readmes")
os.makedirs(dirname + "/SKSE/Plugins")

# Generate BSA archive
print "Generating BSA archive..."
shutil.copy('./Campfire/Archive.exe', './tmp/Archive.exe')
shutil.copy('./Campfire/CampfireArchiveBuilder.txt', './tmp/CampfireArchiveBuilder.txt')
shutil.copy('./Campfire/CampfireArchiveManifest.txt', './tmp/CampfireArchiveManifest.txt')
# Append the translation file entries to the temporary manifest.
with open('./tmp/CampfireArchiveManifest.txt', 'a') as manifest:
    for lang in langs:
        manifest.write('Interface\\Translations\\' + translate_file_name_header + lang[1] + '.txt\r\n')
os.chdir("./tmp")
subprocess.call(['./Archive.exe', './CampfireArchiveBuilder.txt'])
os.chdir("..\\")

# Copy files
shutil.copyfile("./Campfire/Campfire.esm", dirname + "/Campfire.esm")
shutil.copyfile("./tmp/Campfire.bsa", dirname + "/Campfire.bsa")
shutil.copyfile("./Campfire/SKSE/Plugins/StorageUtil.dll", dirname + "/SKSE/Plugins/StorageUtil.dll")
shutil.copyfile("./Campfire/readmes/Campfire_readme.txt", dirname + "/readmes/Campfire_readme.txt")
shutil.copyfile("./Campfire/readmes/Campfire_license.txt", dirname + "/readmes/Campfire_license.txt")
shutil.copyfile("./Campfire/readmes/Campfire_changelog.txt", dirname + "/readmes/Campfire_changelog.txt")

# Clean Up
print "Removing temp files..."
shutil.rmtree("./tmp")

# Create release zip
zip_name_ver = user_input.replace(".", "_")
shutil.make_archive("./Campfire_" + zip_name_ver + "_Release", format="zip", root_dir=dirname)
shutil.move("./Campfire_" + zip_name_ver + "_Release.zip", dirname + "/Campfire_" + zip_name_ver + "_Release.zip")
print "Created " + dirname + "/Campfire_" + zip_name_ver + "_Release.zip"
print "Done!"

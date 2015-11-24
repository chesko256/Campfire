import os
import shutil
import subprocess

print " "
print "==============================="
print "|  Frostfall Release Builder  |"
print "|             \/              |"
print "|         _\_\/\/_/_          |"
print "|          _\_\/_/_           |"
print "|         __/_/\_\__          |"
print "|          / /\/\ \           |"
print "|             /\              |"
print "==============================="
print " "
user_input = raw_input("Enter the release version: ")

os.chdir("..\\")

# Build the temp directory
print "Creating temp directories..."
tempdir = ".\\tmp\\Data\\"
os.makedirs('./tmp/Data/readmes')
os.makedirs('./tmp/Data/Interface/frostfall')
os.makedirs('./tmp/Data/Interface/exported/widgets/frostfall')
os.makedirs('./tmp/Data/Interface/Translations')
os.makedirs('./tmp/Data/meshes/frostfall')
os.makedirs('./tmp/Data/Scripts/Source')
os.makedirs('./tmp/Data/sound/fx/frostfall')
os.makedirs('./tmp/Data/textures/frostfall')

# Copy the project files
print "Copying project files..."
with open("./Campfire/FrostfallArchiveManifest.txt") as manifest:
    lines = manifest.readlines()
    for line in lines:
        shutil.copy(".\\Campfire\\" + line.rstrip('\n'), tempdir + line.rstrip('\n'))

# Build the directories
dirname = "./Frostfall " + user_input + " Release"
if not os.path.isdir(dirname):
    print "Creating new build..."
    os.mkdir(dirname)
else:
    print "Removing old build of same version..."
    shutil.rmtree(dirname)
    os.mkdir(dirname)

os.mkdir(dirname + "/readmes")

# Generate BSA archive
print "Generating BSA archive..."
shutil.copy('./Campfire/Archive.exe', './tmp/Archive.exe')
shutil.copy('./Campfire/FrostfallArchiveBuilder.txt', './tmp/FrostfallArchiveBuilder.txt')
shutil.copy('./Campfire/FrostfallArchiveManifest.txt', './tmp/FrostfallArchiveManifest.txt')
os.chdir("./tmp")
subprocess.call(['./Archive.exe', './FrostfallArchiveBuilder.txt'])
os.chdir("..\\")

# Copy files
shutil.copyfile("./Campfire/Frostfall.esp", dirname + "/Frostfall.esp")
shutil.copyfile("./tmp/Frostfall.bsa", dirname + "/Frostfall.bsa")
shutil.copyfile("./Campfire/readmes/Frostfall_readme.txt", dirname + "/readmes/Frostfall_readme.txt")
shutil.copyfile("./Campfire/readmes/Frostfall_license.txt", dirname + "/readmes/Frostfall_license.txt")
shutil.copyfile("./Campfire/readmes/Frostfall_changelog.txt", dirname + "/readmes/Frostfall_changelog.txt")

# Clean Up
print "Removing temp files..."
shutil.rmtree("./tmp")

# Create release zip
zip_name_ver = user_input.replace(".", "_")
shutil.make_archive("./Frostfall_" + zip_name_ver + "_Release", format="zip", root_dir=dirname)
shutil.move("./Frostfall_" + zip_name_ver + "_Release.zip", dirname + "/Frostfall_" + zip_name_ver + "_Release.zip")
print "Created " + dirname + "/Frostfall_" + zip_name_ver + "_Release.zip"
print "Done!"

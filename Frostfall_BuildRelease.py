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
if os.path.isdir(tempdir):
    print "Removing old temp directory..."
    shutil.rmtree(".\\tmp")
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

os.makedirs(dirname + "/Frostfall/readmes")
os.makedirs(dirname + "/Frostfall/SKSE/Plugins/FrostfallData")
os.makedirs(dirname + "/SkyUI51AddOn/readmes")
os.makedirs(dirname + "/SkyUI51AddOn/SKSE/Plugins/FrostfallData")
os.makedirs(dirname + "/SkyUI51AddOn/Interface/Translations")
os.makedirs(dirname + "/SkyUI51AddOn/Interface/skyui")
os.makedirs(dirname + "/fomod")

# Generate BSA archive
print "Generating BSA archive..."
shutil.copy('./Campfire/Archive.exe', './tmp/Archive.exe')
shutil.copy('./Campfire/FrostfallArchiveBuilder.txt', './tmp/FrostfallArchiveBuilder.txt')
shutil.copy('./Campfire/FrostfallArchiveManifest.txt', './tmp/FrostfallArchiveManifest.txt')

os.chdir("./tmp")
subprocess.call(['./Archive.exe', './FrostfallArchiveBuilder.txt'])
os.chdir("..\\")

# Copy files - Mod
shutil.copyfile("./Campfire/Frostfall.esp", dirname + "/Frostfall/Frostfall.esp")
shutil.copyfile("./tmp/Frostfall.bsa", dirname + "/Frostfall/Frostfall.bsa")
shutil.copyfile("./Campfire/SKSE/Plugins/FrostfallData/READ_THIS_PLEASE_AND_DO_NOT_DELETE.txt", dirname + "/Frostfall/SKSE/Plugins/FrostfallData/READ_THIS_PLEASE_AND_DO_NOT_DELETE.txt")
shutil.copyfile("./Campfire/readmes/Frostfall_readme.txt", dirname + "/Frostfall/readmes/Frostfall_readme.txt")
shutil.copyfile("./Campfire/readmes/Frostfall_license.txt", dirname + "/Frostfall/readmes/Frostfall_license.txt")
shutil.copyfile("./Campfire/readmes/Frostfall_changelog.txt", dirname + "/Frostfall/readmes/Frostfall_changelog.txt")

# Copy files - add-on
shutil.copyfile("./Campfire/readmes/Frostfall_SkyUI_AddOn_readme.txt", dirname + "/SkyUI51AddOn/readmes/Frostfall_SkyUI_AddOn_readme.txt")
shutil.copyfile("./Campfire/SKSE/Plugins/FrostfallData/interface_package_version.json", dirname + "/SkyUI51AddOn/SKSE/Plugins/FrostfallData/interface_package_version.json")
shutil.copyfile("./Campfire/Interface/bartermenu.swf", dirname + "/SkyUI51AddOn/Interface/bartermenu.swf")
shutil.copyfile("./Campfire/Interface/containermenu.swf", dirname + "/SkyUI51AddOn/Interface/containermenu.swf")
shutil.copyfile("./Campfire/Interface/craftingmenu.swf", dirname + "/SkyUI51AddOn/Interface/craftingmenu.swf")
shutil.copyfile("./Campfire/Interface/inventorymenu.swf", dirname + "/SkyUI51AddOn/Interface/inventorymenu.swf")
shutil.copyfile("./Campfire/Interface/skyui/bottombar.swf", dirname + "/SkyUI51AddOn/Interface/skyui/bottombar.swf")
shutil.copyfile("./Campfire/Interface/skyui/itemcard.swf", dirname + "/SkyUI51AddOn/Interface/skyui/itemcard.swf")
shutil.copyfile("./Campfire/Interface/Translations/skyui_czech.txt", dirname + "/SkyUI51AddOn/Interface/Translations/skyui_czech.txt")
shutil.copyfile("./Campfire/Interface/Translations/skyui_english.txt", dirname + "/SkyUI51AddOn/Interface/Translations/skyui_english.txt")
shutil.copyfile("./Campfire/Interface/Translations/skyui_french.txt", dirname + "/SkyUI51AddOn/Interface/Translations/skyui_french.txt")
shutil.copyfile("./Campfire/Interface/Translations/skyui_german.txt", dirname + "/SkyUI51AddOn/Interface/Translations/skyui_german.txt")
shutil.copyfile("./Campfire/Interface/Translations/skyui_italian.txt", dirname + "/SkyUI51AddOn/Interface/Translations/skyui_italian.txt")
shutil.copyfile("./Campfire/Interface/Translations/skyui_japanese.txt", dirname + "/SkyUI51AddOn/Interface/Translations/skyui_japanese.txt")
shutil.copyfile("./Campfire/Interface/Translations/skyui_polish.txt", dirname + "/SkyUI51AddOn/Interface/Translations/skyui_polish.txt")
shutil.copyfile("./Campfire/Interface/Translations/skyui_russian.txt", dirname + "/SkyUI51AddOn/Interface/Translations/skyui_russian.txt")
shutil.copyfile("./Campfire/Interface/Translations/skyui_spanish.txt", dirname + "/SkyUI51AddOn/Interface/Translations/skyui_spanish.txt")

# Copy files - Installer
shutil.copyfile("./Campfire/Installers/Frostfall/fomod/info.xml", dirname + "/fomod/info.xml")
shutil.copyfile("./Campfire/Installers/Frostfall/fomod/script.cs", dirname + "/fomod/script.cs")

# Create release zip
zip_name_ver = user_input.replace(".", "_")
shutil.make_archive("./Frostfall_" + zip_name_ver + "_Release", format="zip", root_dir=dirname)
shutil.move("./Frostfall_" + zip_name_ver + "_Release.zip", dirname + "/Frostfall_" + zip_name_ver + "_Release.zip")
print "Created " + dirname + "/Frostfall_" + zip_name_ver + "_Release.zip"

# Clean Up
print "Removing temp files..."
shutil.rmtree("./tmp")

print "Done!"

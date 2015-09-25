import os
import shutil
import subprocess

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
print os.getcwd()

# Build the directories
dirname = "./Campfire " + user_input + " Release"
if not os.path.isdir(dirname):
    os.mkdir(dirname)
else:
	shutil.rmtree(dirname)
	os.mkdir(dirname)

os.mkdir(dirname + "/readmes")
os.mkdir(dirname + "/SKSE")
os.mkdir(dirname + "/SKSE/Plugins")

if not os.path.isdir("./tmp"):
    os.mkdir("./tmp")
else:
    shutil.rmtree("./tmp")
    os.mkdir("./tmp")

# Generate BSA archive
subprocess.call(['./Archive.exe', './Campfire/CampfireArchiveBuilder.txt'])

# Copy files
shutil.copyfile("./Campfire/Campfire.esm", dirname + "/Campfire.esm")
shutil.copyfile("./tmp/Campfire.bsa", dirname + "/Campfire.bsa")
shutil.copyfile("./Campfire/SKSE/Plugins/StorageUtil.dll", dirname + "/SKSE/Plugins/StorageUtil.dll")
shutil.copyfile("./Campfire/readmes/Campfire_readme.txt", dirname + "/readmes/Campfire_readme.txt")
shutil.copyfile("./Campfire/readmes/Campfire_license.txt", dirname + "/readmes/Campfire_license.txt")
shutil.copyfile("./Campfire/readmes/Campfire_changelog.txt", dirname + "/readmes/Campfire_changelog.txt")

# Clean Up
shutil.rmtree("./tmp")

# Create release zip
zip_name_ver = user_input.replace(".", "_")
shutil.make_archive("./Campfire_" + zip_name_ver + "_Release", format="zip", root_dir=dirname)
shutil.move("./Campfire_" + zip_name_ver + "_Release.zip", dirname + "/Campfire_" + zip_name_ver + "_Release.zip")
print "Done!"
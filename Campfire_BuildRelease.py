import os
import shutil
import subprocess

print "Build Campfire Release"
user_input = raw_input("Enter the release version: ")

# Build the directories
if not os.path.isdir("./Releases/"):
    os.mkdir("./Releases/")

dirname = "Releases/" + user_input
if not os.path.isdir("./" + dirname + "/"):
    os.mkdir("./" + dirname + "/")
else:
	shutil.rmtree(dirname)
	os.mkdir("./" + dirname + "/")

os.mkdir("./" + dirname + "/readmes")
os.mkdir("./" + dirname + "/SKSE")
os.mkdir("./" + dirname + "/SKSE/Plugins")

os.mkdir("./tmp")

# Generate BSA archive
subprocess.call(['./Archive.exe', 'CampfireArchiveBuilder.txt'])

# Copy files
shutil.copyfile("./Campfire.esm", "./" + dirname + "/Campfire.esm")
shutil.copyfile("./tmp/Campfire.bsa", "./" + dirname + "/Campfire.bsa")
shutil.copyfile("./SKSE/Plugins/StorageUtil.dll", "./" + dirname + "/SKSE/Plugins/StorageUtil.dll")
shutil.copyfile("./readmes/Campfire_readme.txt", "./" + dirname + "/readmes/Campfire_readme.txt")
shutil.copyfile("./readmes/Campfire_license.txt", "./" + dirname + "/readmes/Campfire_license.txt")
shutil.copyfile("./readmes/Campfire_changelog.txt", "./" + dirname + "/readmes/Campfire_changelog.txt")

# Clean Up
shutil.rmtree("./tmp")

# Create release zip
zip_name_ver = user_input.replace(".", "_")
shutil.make_archive("./Campfire_" + zip_name_ver + "_Release", format="zip", root_dir="./" + dirname)
shutil.move("./Campfire_" + zip_name_ver + "_Release.zip", "./" + dirname + "/Campfire_" + zip_name_ver + "_Release.zip")
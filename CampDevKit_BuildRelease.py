import os
import shutil
import subprocess

print " "
print "======================================"
print "|  Campfire Dev Kit Release Builder  |"
print "|                           _   _    |"
print "|                          ( \_/ )   |"
print "|             _   _       __) _ (__  |"
print "|     _   _  ( \_/ )  _  (__ (_) __) |"
print "|    ( \_/ )__) _ (__( \_/ )) _ (    |"
print "|   __) _ ((__ (_) __)) _ ((_/ \_)   |"
print "|  (__ (_) __)) _ ((__ (_) __)       |"
print "|     ) _ (  (_/ \_)  ) _ (          |"
print "|    (_/ \_)         (_/ \_)         |"
print "======================================"
print " "
user_input = raw_input("Enter the release version: ")

os.chdir("..\\")

# Build the directories
dirname = "./CampDevKit " + user_input + " Release"
if not os.path.isdir(dirname):
    print "Creating new build..."
    os.mkdir(dirname)
else:
    print "Removing old build of same version..."
    shutil.rmtree(dirname)
    os.mkdir(dirname)

os.makedirs(dirname + "/readmes")
os.makedirs(dirname + "/meshes/campfire")
os.makedirs(dirname + "/textures/campfire")
os.makedirs(dirname + "/Scripts/Source")

# Copy the project files
print "Copying project files..."
with open("./Campfire/CampDevKitArchiveManifest.txt") as manifest:
    lines = manifest.readlines()
    for line in lines:
        if line.startswith("externals"):
            shutil.copy(".\\Campfire\\CampDevKit\\RequiredExternals\\" + line.lstrip('externals ').rstrip('\n'), dirname + "/" + line.lstrip('externals ').rstrip('\n'))
        else:
            shutil.copy(".\\Campfire\\" + line.rstrip('\n'), dirname + "/" + line.rstrip('\n'))

# Create release zip
zip_name_ver = user_input.replace(".", "_")
shutil.make_archive("./CampDevKit_" + zip_name_ver + "_Release", format="zip", root_dir=dirname)
shutil.move("./CampDevKit_" + zip_name_ver + "_Release.zip", dirname + "/CampDevKit_" + zip_name_ver + "_Release.zip")
print "Created " + dirname + "/CampDevKit_" + zip_name_ver + "_Release.zip"
print "Done!"

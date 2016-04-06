import os
import shutil

print " "
print "Pushing files to Fallout 4 game directory..."
print " "

os.chdir("..\\")

fo4_dir = "..\\..\\..\\SteamLibrary\\steamapps\\common\\Fallout 4\\Data\\"

# Copy the project files
print "Copying project files..."
with open("./Campfire/CampfireArchiveManifest.txt") as manifest:
    lines = manifest.readlines()
    for line in lines:
    	if not os.path.isfile(".\\Campfire\\" + line.rstrip('\n')):
    		pass
    	else:
            shutil.copy(".\\Campfire\\" + line.rstrip('\n'), fo4_dir + line.rstrip('\n'))
            print "Copied " + line.rstrip('\n')

print "Done!"

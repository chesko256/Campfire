"""A script to take the pain out using mod project directories without ModOrganizer."""

import os
import sys
import shutil

fo4_dir = None


def run():
    global fo4_dir

    os.chdir("..\\")
    if len(sys.argv) < 3:
        printhelp()
        sys.exit()

    fo4_dir = sys.argv[1] + "\\"
    flag = sys.argv[2]

    if fo4_dir is None or fo4_dir == "":
        printhelp()
        sys.exit()

    if flag == "clean":
        clean()
    elif flag == "pull":
        pullplugin()
    elif flag == "push":
        push()
    elif flag == "help":
        printhelp()


def printhelp():
    print "Usage: ModTools.py <Fallout 4 Game Directory> <flag>"
    print "Flags:"
    print "    push - Pushes all manifest files from project directory to game directory."
    print "    pull - Pulls the game directory plugin files to project directory, if game directory version is newer."
    print "    clean - Removes all manifest files from the game directory. Also performs 'pull' before cleaning in order to prevent destroying a newer plugin file."
    print "    help - Prints this help message."


def pullplugin():
    print " "
    print "Checking Fallout 4 game directory plugin..."
    print " "

    repo_plugin_time = os.path.getmtime("./Campfire/CampfireFO4.esp")
    gamedir_plugin_time = os.path.getmtime(fo4_dir + "CampfireFO4.esp")
    if repo_plugin_time < gamedir_plugin_time:
        print "The game directory plugin is newer than the project directory version, copying..."
        shutil.copy(fo4_dir + "CampfireFO4.esp", "./Campfire/CampfireFO4.esp")
    else:
        print "The project directory plugin is up-to-date."

    print "Done!"


def clean():
    print " "
    print "Cleaning Fallout 4 game directory..."
    print " "

    # Make sure we don't destroy a new plugin file version.
    repo_plugin_time = os.path.getmtime("./Campfire/CampfireFO4.esp")
    gamedir_plugin_time = os.path.getmtime(fo4_dir + "CampfireFO4.esp")
    if repo_plugin_time < gamedir_plugin_time:
        print "The game directory plugin is newer than the project directory version, copying..."
        shutil.copy(fo4_dir + "CampfireFO4.esp", "./Campfire/CampfireFO4.esp")

    os.remove(fo4_dir + "CampfireFO4.esp")
    print "Removed CampfireFO4.esp"

    with open("./Campfire/CampfireArchiveManifest.txt") as manifest:
        lines = manifest.readlines()
        for line in lines:
            if os.path.isfile(fo4_dir + line.rstrip('\n')):
                os.remove(fo4_dir + line.rstrip('\n'))
                print "Removed " + line.rstrip('\n')

    print "Done!"


def push():
    print " "
    print "Pushing files to Fallout 4 game directory..."
    print " "

    # Copy the project files
    print "Copying project files..."
    with open("./Campfire/CampfireArchiveManifest.txt") as manifest:
        lines = manifest.readlines()
        for line in lines:
            if os.path.isfile(".\\Campfire\\" + line.rstrip('\n')):
                shutil.copy(".\\Campfire\\" + line.rstrip('\n'), fo4_dir + line.rstrip('\n'))
                print "Copied " + line.rstrip('\n')

    print "Done!"

run()

import sys
import os.path
from os import listdir
from os.path import isfile, join

def ParseManifest():
    with open("./" + sys.argv[1]) as manifest:
        lines = manifest.readlines()
        all_files_present = True
        for line in lines:
            if not os.path.isfile(".\\" + line.rstrip('\n')):
                print "    " + str(line.rstrip('\n').replace('//', '/') + " was not found in the project directory.")
                all_files_present = False

        if all_files_present == True:
            print "    OK - All files in manifest found."

def ParseDir(dir_to_check):
    if not os.path.isdir(dir_to_check):
        print "    OK - Skipping " + dir_to_check.replace("//", "/")
        return

    onlyfiles = [ f for f in listdir(dir_to_check) if isfile(join(dir_to_check,f)) ]
    all_files_present = True
    for file in onlyfiles:
        if not file in open(sys.argv[1]).read():
            # Check exception tags
            exception_found = False
            for idx, tag in enumerate(sys.argv):
                if idx >= 3:
                    if file.startswith(tag):
                        exception_found = True
                        break
                        
            if exception_found == False:
                print "    WARN - " + dir_to_check.replace('//', '/') + ": " + str(file) + " found in project directory, but not in manifest file!"
                all_files_present = False

    if all_files_present == True:
        print "    OK - " + dir_to_check.replace('//', '/')

if sys.argv[1] is None:
    print "Invalid parameters."
else:
    print "==============================================================="
    print "  Checking " + sys.argv[2] + " project files..."
    print "==============================================================="
    print "  Parsing manifest..."
    ParseManifest()
    print "  Parsing project directories..."
    ParseDir(".//readmes")
    ParseDir(".//Interface//" + sys.argv[2])
    ParseDir(".//Interface//exported//widgets//" + sys.argv[2])
    ParseDir(".//Interface//Translations//")
    ParseDir(".//meshes//" + sys.argv[2])
    ParseDir(".//textures//" + sys.argv[2])
    ParseDir(".//Scripts")
    ParseDir(".//Scripts//Source")
    ParseDir(".//SEQ")
    ParseDir(".//sound//fx//" + sys.argv[2])
    
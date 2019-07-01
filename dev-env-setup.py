#!/usr/bin/env python3
import os, sys

def util():
    print("Installing git")
    os.system("sudo apt-get install git")
    print("Installing snap and snapd")
    os.system("sudo apt-get install snap snapd")
    print("Installing curl")
    os.system("sudo apt-get install curl")




args = sys.argv[1:]
args.sort()
print("updating system")
os.system("sudo apt-get update && sudo apt-get upgrade")

if len(args==0):
    pass 
    #do all
    util()
else:

    for arg in args:
        if arg == "--util":
            pass
        elif arg == "--idea":
            pass
        elif arg == "--shell":
            pass
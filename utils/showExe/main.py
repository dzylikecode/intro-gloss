import os
import sys

currentFile = os.path.abspath(__file__)
# currentFile = os.path.abspath('') # for ipynb
currentFolder = os.path.dirname(currentFile)
rootPath = os.path.join(os.path.dirname(currentFolder), "..")
rootPath = os.path.abspath(rootPath)

cabal = filter(lambda x: x.endswith(".cabal"), os.listdir(rootPath))
cabal = list(cabal)[0]

content = ""
with open(os.path.join(rootPath, cabal), "r") as f:
    content = f.readlines()
exes = filter(lambda x: x.startswith("Executable"), content)
exes = map(lambda x: x.split()[1], exes)
exes = list(exes)
exes = sorted(exes)


def prettyShow():
    for i, exe in enumerate(exes):
        print(f"{i+1:02} - {exe}")


if __name__ == "__main__":
    if len(sys.argv) == 1:
        prettyShow()
    else:
        print(exes[int(sys.argv[1]) - 1])

import os

currentFile = os.path.abspath(__file__)
# currentFile = os.path.abspath('') # for ipynb
currentFolder = os.path.dirname(currentFile)
rootPath = os.path.join(os.path.dirname(currentFolder), "..")
rootPath = os.path.abspath(rootPath)

picturePath = os.path.join(rootPath, "picture")
rasterPath = os.path.join(rootPath, "raster")


class Doc:
    def __init__(self, folder, name):
        self.name = name
        self.folder = folder

    def path(self):
        return f"{self.folder}/{self.name}/README.md"

    def link(self):
        return f"/{self.path()}"

    def markdownLink(self):
        return f"- [{self.name}]({self.link()})"

    def absPath(self):
        return os.path.join(rootPath, self.path())

    def createDoc(self):
        if not os.path.exists(self.absPath()):
            with open(self.absPath(), "w") as f:
                f.write(f"# {self.name}")


def generate(folder, path):
    folders = filter(lambda x: os.path.isdir(
        os.path.join(path, x)), os.listdir(path))
    docs = map(lambda x: Doc(folder, x), folders)
    for doc in docs:
        doc.createDoc()
        print(doc.markdownLink())


generate("picture", picturePath)
generate("raster", rasterPath)

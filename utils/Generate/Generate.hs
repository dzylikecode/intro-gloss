module Generate.Generate where

-- | generate corsponding markdown file for each folder in docs 
-- >>> generate "example/"
-- `example/` 下面的子目录会生成对应的 `README.md` 文件


import Text.Printf 
import System.Directory
import Control.Monad
import System.FilePath 

toProjectPath :: String -> String
toProjectPath = ("." <>)

data Doc = Doc { name          :: String -- ^ the name of Markdown file 
               , rootPath      :: String -- ^ the root path of the project
               , workSpacePath :: String -- ^ the relative path, `/example`: `/` is the root path of the project
               } deriving (Show)

getAbsPath :: Doc -> FilePath
getAbsPath doc = joinPath [rootPath doc, toProjectPath $ getRoute doc] 

getRoute :: Doc -> String
getRoute doc = joinPath [workSpacePath doc, "README.md"] 

transformMarkdownLink :: Doc -> String
transformMarkdownLink doc = printf "- [%s](%s)" (name doc) (getRoute doc)


--------------------------------------------------------------------------------

-- | Markdown template
templateContent doc = unlines 
  [ printf "# %s" (name doc)
  , ""
  ]


checkDocExist :: Doc -> IO Bool
checkDocExist = doesFileExist . getAbsPath 

createDocFile :: Doc -> IO ()
createDocFile doc = writeFile (getAbsPath doc) (templateContent doc)

--------------------------------------------------------------------------------


-- path: relative path. e.g. `/example/`
getAllDirs root path = listDirectory fullPath >>= filterM isDir
  where 
    fullPath = joinPath [root, toProjectPath path]
    isDir dir = doesDirectoryExist $ joinPath [fullPath, dir]

dirToDoc (root, path, dir) = 
  Doc { name = dir 
      , rootPath = root
      , workSpacePath = joinPath [path, dir]
      }

generate :: String -> String -> IO [String] 
generate root path = do
  dirs <- getAllDirs root path
  let docs = map (\dir -> dirToDoc (root, path, dir)) dirs
  forM_ docs $ \doc -> do
    exist <- checkDocExist doc
    unless exist $ createDocFile doc
  let summary = map transformMarkdownLink docs
  putStrLn $ unlines summary
  return summary

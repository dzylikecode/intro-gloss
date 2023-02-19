module ShowExe.ShowExe where

import System.Directory
import System.FilePath
import Data.List
-- | show all the executable files in the cabal file
-- >>> showExe root

findCabal :: FilePath -> IO FilePath
findCabal root = do
  files <- listDirectory root
  let cabal = head . filter (".cabal" `isSuffixOf`) $ files
  return $ joinPath [root, cabal]

filterExe :: String -> [String]
filterExe content = map getExeName . filterExeLines $ lines content
  where 
    filterExeLines = filter ("Executable" `isPrefixOf`) 
    getExeName = last . words

showExe :: FilePath -> IO [String]
showExe root = do
  cabal <- findCabal root
  content <- readFile cabal
  return $ sort . filterExe $ content


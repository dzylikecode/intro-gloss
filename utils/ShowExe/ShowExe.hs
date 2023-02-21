module ShowExe.ShowExe
  ( parseArgs
  , showExe
  ) where

import Text.Printf 
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
    getExeName     = last . words

showExe :: FilePath -> IO [String]
showExe root = do
  cabal   <- findCabal root
  content <- readFile cabal
  return $ sort . filterExe $ content

printUsage :: IO ()
printUsage = do
  putStr $ unlines
    [ "Usage: ls [options]"
    , "  -n: show the number of executable files"
    , "  -h: show the usage"
    ]

parseArgs :: FilePath -> [String] -> IO ()
parseArgs root args
  | "-h" `elem` args 
  = printUsage
  | "-n" `elem` args 
  = do
    exes <- showExe root
    let nums      = [1..] :: [Int]
    let formatExe = zipWith (printf "%02d. %s") nums exes 
    putStrLn $ unlines formatExe
  | otherwise
  = do
    exes <- showExe root
    putStrLn $ unlines exes

parseArgs' root args = do
  print args
  parseArgs root args
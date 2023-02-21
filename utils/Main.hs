{-# LANGUAGE PatternGuards #-}


-- | command line for Utility
-- >>> gloss
-- show usage
-- >>> gloss ls
-- default: sort the executable files
-- show all the executable files in the cabal file
-- >>> gloss ls -n
-- -n: show the number of executable files
-- >>> gloss run <name>
-- run the executable file
-- >>> gloss run <number>
-- run the executable file
-- >>> gloss md
-- generate the README.md file
-- show the summary
-- >>> gloss md "/example"
-- generate the README.md file
-- show the summary

import qualified Generate.Generate as Generate
import System.Directory
import qualified ShowExe.ShowExe as ShowExe
import System.Environment
import qualified RunExe.RunExe as RunExe


main :: IO ()
main = do
  args <- getArgs
  root <- getCurrentDirectory
  parseArgs root args

printUsage :: IO ()
printUsage = do
  putStr $ unlines
    [ "Usage: gloss <command>|<options> [args]"
    , "  command:"
    , "    ls: show the executable files"
    , "    run: run the executable file"
    , "    md: generate the README.md file"
    , "  options:"
    , "    -h: print this help message"
    ]

parseArgs :: FilePath -> [String] -> IO ()
parseArgs root args
  | "-h" : _ <- args  
  = printUsage
  | "ls" : args' <- args
  = ShowExe.parseArgs root args'
  | "run" : args' <- args
  = RunExe.parseArgs root args'
  | "md" : args' <- args
  = Generate.parseArgs root args'
  | otherwise
  = printUsage

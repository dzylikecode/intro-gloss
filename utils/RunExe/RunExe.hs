{-# LANGUAGE PatternGuards #-}

module RunExe.RunExe
  ( parseArgs
  , runExe
  ) where

import Text.Printf
import System.Process
import qualified ShowExe.ShowExe as ShowExe
import Data.Char

getExeName root n = do
  exes <- ShowExe.showExe root
  return $ exes !! (n - 1)

runExe :: String -> [String] -> IO ()
runExe name args = do
  let cmd = printf "stack exec %s -- %s" name (unwords args)
  system cmd
  return ()

printUsage :: IO ()
printUsage = do
  putStr $ unlines
    [ "Usage: run <options>|<number>|<name> [args]"
    , "  number: number of the executable to run"
    , "  name: name of the executable to run"
    , "  args: arguments to pass to the executable"
    , "  options:"
    , "    -h: print this help message"
    ]

parseArgs :: FilePath -> [String] -> IO ()
parseArgs root args
  | "-h" : _ <- args 
  = printUsage
  | n : args' <- args
  , all isDigit n
  = do
    name <- getExeName root (read n)
    parseArgs root (name : args')
  | name : args' <- args
  = runExe name args'
  | otherwise
  = printUsage


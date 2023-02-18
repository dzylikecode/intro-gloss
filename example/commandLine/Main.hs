-- | Command Line.
module Main where

import Graphics.Gloss
import System.Environment

main :: IO ()
main = do
  arg <- getArgs
  print arg
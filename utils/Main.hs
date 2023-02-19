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

import Generate.Generate
import System.Directory
import ShowExe.ShowExe

main :: IO ()
main = do
  root <- getCurrentDirectory
  generate root "/temp"
  showExe root >>= print
  return ()

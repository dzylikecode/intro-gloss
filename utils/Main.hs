import Generate.Generate

main :: IO ()
main = do
  putStrLn "Hello, Haskell!"
  generate "/temp"
  return ()

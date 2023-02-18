import Graphics.Gloss

main =
  display
    (InWindow "test" (200, 200) (10, 10))
    white
    $ Rotate 45
    $ Line [(0, 0), (100, 0)]
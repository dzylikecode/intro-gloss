-- | Breathe.
--  This example shows how to use the Gloss animation library.
module Main where

import Graphics.Gloss

main :: IO ()
main = do
  animate
    (InWindow "Breathe" (500, 650) (20, 20))
    black
    breathe

breathe :: Float -> Picture
breathe t = Color fillCol $ circleSolid $ 100 + 10 * sin (2 * t)
  where
    fillCol = makeColorI 0 greenPart 0 255
    greenPart = round $ 180 + 60 * sin (2 * t)

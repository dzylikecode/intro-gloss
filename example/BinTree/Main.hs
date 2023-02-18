-- | Tree Fractal.
--      Based on ANUPlot code by Clem Baker-Finch.
module Main where

import Graphics.Gloss
import System.Environment

halfWidth = 10

height = 200

main :: IO ()
main = do
  (degS : _) <- getArgs
  let deg = read degS :: Int
  display
    (InWindow "Tree" (500, 650) (20, 20))
    black
    (picture deg)

-- The picture is a tree fractal, graded from brown to green
picture :: Int -> Picture
picture degree =
  Translate 0 (-300) $
    tree degree (dim $ dim brown)

-- Basic stump shape
stump :: Color -> Picture
stump color =
  Color color $
    Polygon
      [ 
        ( halfWidth  , 0      ) ,
        ( halfWidth  , height ) ,
        ( -halfWidth , height ) ,
        ( -halfWidth , 0      )
      ]

-- Make a tree fractal.
tree ::
  Int -> -- Fractal degree
  Color -> -- Color for the stump
  Picture
tree 0 color = stump color
tree n color =
  let smallTree =
        Scale 0.5 0.5 $
          tree (n - 1) (greener color)
   in Pictures
        [ 
          stump color,
          Translate 0 height $ Rotate (-40) smallTree,
          Translate 0 height $ Rotate (40) smallTree
        ]

-- A starting colour for the stump
brown :: Color
brown = makeColorI 139 100 35 255

-- Make this color a little greener
greener :: Color -> Color
greener = mixColors 1 10 green

import Graphics.Gloss

polyToXY (r, theta) = (r * cos radiusTheta, r * sin radiusTheta)
  where
    radiusTheta = theta * pi / 180

dist (x1, y1) (x2, y2) = sqrt $ (x1 - x2) ^ 2 + (y1 - y2) ^ 2

-- 构造等腰三角形
-- 顶角的外角为18°, 则顶角: 162
-- 腰: 100
--      A
--  B       C
triangle = (a, b, c)
  where
    a = (0, 0)
    b = polyToXY (100, -90 - theta)
    c = polyToXY (100, -90 + theta)
    theta = 162 / 2

bc (_, b, c) = dist b c

ab (a, b, _) = dist a b

reverseP (x, y) = (-x, -y)

-- 旋转的半径
-- 圆心角: 4°
-- 弦: BC

rCirc theta x = x / (2 * sin (theta / 2))
  where
    radiusTheta = theta * pi / 180

transP (x, y) (px, py) = (px + x, py + y)

transTri v (a, b, c) = (transP v a, transP v b, transP v c)

movBToO tri@(_, b, _) = transTri (reverseP b) tri

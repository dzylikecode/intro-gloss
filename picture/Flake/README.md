# Flake

[](Main.hs ":include :type=code hs")

## explanation

```hs
Pictures
        [ newSide
        , Translate (edge/3) 0                    $ Rotate 60    newSide
        , Translate (edge/2) (-(edge * sqrt 3)/6) $ Rotate (-60) newSide
        , Translate (2 * edge/3) 0                $ newSide ]
```

`_/\_` 进行不断递归

`_/\_` 作为递归模式

初始化是`_`, 一条直线

> 不是用三角形得到的, 三角形是`side`的进一步组合而成的

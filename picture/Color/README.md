# Color

[](Main.hs ":include :type=code hs")

## explanation

```hs
  [ Translate
      (200 * cos (2 * pi * (fromIntegral n) / 12))
      (200 * sin (2 * pi * (fromIntegral n) / 12))
      $ Color (withAlpha 0.8 c)
      $ circleSolid 100
    | n <- [0 .. length colors]
    | c <- colors
  ]
```

[ParallelListComp](https://www.schoolofhaskell.com/user/PthariensFlame/guide-to-ghc-extensions/list-and-comprehension-extensions#parallellistcomp): 多个`|`

> 相当于使用 zip

生成了 12 个元素

---

`2 * pi * (fromIntegral n) / 12)`将角度均匀地分布

---

生成方法:

```hs
Translate x y
      $ Color (withAlpha 0.8 c)
      $ circleSolid 100
```

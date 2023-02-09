# binary tree

```bash
gloss_run <num> -- 2 # 2 is the depth of the tree
```

[](Main.hs ":include :type=code hs")

## explanation

通过`tree`函数生成一系列的`Picture`

理解[Picture](https://hackage.haskell.org/package/gloss-1.13.2.2/docs/Graphics-Gloss-Data-Picture.html)

```hs
data Picture = Pictures [Picture]
```

---

`smallTree`是递归的过程

`Scale 0.5 0.5`将当前的`Tree`缩小一半, 变成`smallTree`

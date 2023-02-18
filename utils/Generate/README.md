# generate content

我觉得代码非常好看, OOP 与 FP 结合起来

`Doc(folder, x)`看作是映射到一个类上面思考, 然后类里面的方法, 就是在类的范畴上思考的表现

## Haskell

`getCurrentDirectory`:: IO FilePath

获取当前执行命令的路径

`listDirectory`:: FilePath -> IO [FilePath]

获取当前路径下的所有文件, 文件与文件夹

---

花了一个下午和晚上都没有写完, 感觉一开始思路混乱, 没有耐心地设计. 感觉过于抽象, 导致自己无从下手.

觉得一开始要设计好整体的接口, 自定向下, 然后可以有些涂鸦, 最后进一步 refactor 代码.

---

想一边写实例, 一边推进思路

---

在写的过程, 逐渐深入, 发现可以一开始就用 project path 的概念来思考, 用`/example`这样的想法来思考

但是这样会引入 getCurrentDirectory, 但是这个函数是 IO, 会污染其他, 最好还是备份一个 rootPath

---

一个函数实现一个功能, 确实会轻松很多

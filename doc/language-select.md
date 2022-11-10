## 使用godot应该选择哪种语言GdScript, Lua, C#, Java, Rust或者C++ ？

- GdScript是godot亲儿子，定制化后的语言更加简单容易上手，是开源语言
    - GDScript快速加载无需编译，无任何等待
    - GDScript没有gc，没有垃圾回收器
    - 可以热更新


- C#由微软主导，难度稍微大一点
    - C#需要编译和等待
    - 运行的时候有gc，会导致卡顿
    - 可以热更新，但是极其复杂，https://github.com/focus-creative-games/hybridclr


- C++大佬随意


- Java难度稍微大一点，依赖于Jvm，https://github.com/utopia-rise/godot-kotlin-jvm


- Rust难度非常大，语法复杂，https://github.com/godot-rust/godot-rust


- Lua简单，https://github.com/perbone/luascript


- JavaScript简单，https://github.com/godot-js/godot-js

## 新手如何入门一门编程语言？

- 一点编程语言基础都没有的，先学Java，资料和教程多，遇到问题容易解决

- godot是基于节点的一个游戏引擎，节点就是一个面向对象编程的思想，GdScript也是面向对象的脚本语言

```
面向对象的三个基本特征是封装、继承、多态。

所谓封装，也就是把客观事物封装成抽象的类，并且类可以把自己的数据和方法只让可信的类或者对象操作，对不可信的进行信息隐藏。
继承是指这样一种能力：它可以使用现有类的所有功能，并在无需重新编写原来的类的情况下对这些功能进行扩展。
所谓多态就是指一个类实例的相同方法在不同情形有不同表现形式。多态机制使具有不同内部结构的对象可以共享相同的外部接口。
```

- C++ -> C -> Java/C# -> go ->  GdScript，难度排名

```
C#资料少，遇到问题容易卡主学习者
go虽然简单，但是因为不是面向对象的，不推荐学习，godot是面向对象编程的一个游戏引擎
Cpp天生对新手不友好
```

- 有一点编程基础，直接开搞，GdScript确实非常简单

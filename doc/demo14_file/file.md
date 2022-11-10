# 1. godot的文件系统

![Image text](image/file1.png)
![Image text](image/file2.png)

- 资源路径

```
访问资源时，使用主机OS文件系统布局可能很麻烦且不可移植。为了解决这个问题，创建了特殊路径 res://。
路径res://将始终指向项目根目录 (project.godot所在的位置，因此res://project.godot始终有效)
仅当从编辑器本地运行项目时，此文件系统才是读写的。
导出时或在其他设备（例如手机或控制台，或从DVD运行）上运行时，文件系统将变为只读状态，并且将不再允许写入。 
```

![Image text](image/file5.png)

- 用户路径

```
诸如保存游戏状态或下载内容包之类的任务仍需要写入磁盘。
为此，引擎确保存在始终可写的特殊路径user://。
根据项目运行所在的操作系统，此路径的解析方式有所不同。

Windows: %APPDATA%\Godot\

macOS: ~/Library/Application Support/Godot/

Linux: ~/.local/share/godot/
```

![Image text](image/file6.png)
![Image text](image/file7.png)

# 2. 通过文件持久化游戏数据

![Image text](image/file3.png)
![Image text](image/file4.png)

# 3. autoload单例模式

![Image text](image/autoload1.png)
![Image text](image/autoload2.png)
![Image text](image/autoload3.png)
![Image text](image/autoload4.png)
![Image text](image/autoload5.png)

# 1. AudioStreamPlayer节点播放声音

- AudioStreamPlayer适合用来播放BGM，AudioStreamPlayer2D、AudioStreamPlayer3D播放时声源带有位置信息，会出现左右声道不一致的问题。
- 每个AudioStreamPlayer可以将音频绑定到某一个Audio Bus中，然后直接控制Bus的音量。 例如，以下代码可以使名为Master的Bus静音。

```
AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), mute)
```

![Image text](image/audio1.png)
![Image text](image/audio2.png)
![Image text](image/audio3.png)
![Image text](image/audio4.png)

- 声频信号是一组数字信号，以二级制的形式存储在文件中

![Image text](image/audio5.png)

- 音频信号流就是一个声音从它的源头到输出的整一个流程，这个流程中会经历多种设备

![Image text](image/audio6.png)

- 音频混合，混音

![Image text](image/audio7.png)
![Image text](image/audio8.png)
![Image text](image/audio9.png)
![Image text](image/audio10.png)
![Image text](image/audio11.png)
![Image text](image/audio12.png)
![Image text](image/audio13.png)
![Image text](image/audio14.png)

- ogg与mp3一样也是一种有损压缩的音频格式文件

```
ogg音频格式文件与其它音频不同在于它是完全免费、开放、没有专利限制的。
由于ogg格式是完全开放和免费的，所以可以获得大量的编码器和播放器，这也是为何MP3编码器如此少而且大多是商业软件的原因。
ogg文件格式可以不断地进行大小和音质的改良，而不影响旧的编码器或播放器。
```

- ogg相比MP3它可以在相对较低的数据速率下实现比MP3更好的音质

```
ogg相比MP3它可以在相对较低的数据速率下实现比MP3更好的音质
虽然目前ogg格式的音频文件在音质与MP3格式的文件相当，但由于ogg使用了一种灵活的格式，
能够在文件格式已经固定下来后还能对音质进行明显的调节和新算法训练。
此外，Ogg Vorbis支持VBR（可变比特率）和ABR（平均比特率）两种编码方式，Ogg还具有比特率缩放功能，可以不用重新编码便可调节文件的比特率。
```

- ogg格式可以对所有声道进行编码，支持多声道模式，而不像MP3只能编码双声道

```
多声道音乐会带来更多临场感，欣赏电影和交响乐时更有优势，这场革命性的变化是MP3无法支持的。
相信在未来人们对音质要求不断提高，Ogg的优势将更加明显。
支持ogg格式的播放器有很多，如winamp、千千静听等，你也可以使用转换器转换为自己喜欢的格式。
```

![Image text](image/audio15.png)
![Image text](image/audio16.png)
![Image text](image/audio17.png)
![Image text](image/audio18.png)
![Image text](image/audio19.png)
![Image text](image/audio21.png)
![Image text](image/audio22.png)

# 1. CanvasItem之draw和update

- Canvas是画布的意思，所以CanvasItem代表了就是可以被绘制节点，可以设置可视化界面和材质的颜色
  ![Image text](image/canvas1.png)


- 所有的2D节点和GUI节点都继承于CanvasItem节点
  ![Image text](image/canvas2.png)


- CanvasItem是按树的树的深度优先遍历顺序绘制的
  ![Image text](image/canvas3.png)


- draw指定了要绘制的东西
  ![Image text](image/canvas4.png)


- 当要draw绘制的改变了，需要调用update
  ![Image text](image/canvas5.png)


- hide和show，隐藏和现实节点
  ![Image text](image/canvas6.png)


- CanvasItem可以绘制直线，正方形，长方形，圆，图片
  ![Image text](image/canvas7.png)

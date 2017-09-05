# CALayer_Watch
实现带指针的钟表动画

锚点是个神马东东？

锚点是神马吶？打个比方，我们耍双截棍的时候，双截棍其实都是围绕咱们握拳的地方转来转去的，👊其实就是双截棍的锚点。

再打个比方，我们在一张A4纸上面钉一个📌。然后旋转A4纸，那颗图钉的位置就是A4纸的锚点。

所以锚点肯定是个坐标点喽～有X、Y组成。锚点的数值范围就是0～1。0表示在最左边或者最上边，1表示在最右边或者最下边。有点模糊是不？再来张图就更清楚了：

![](https://github.com/zpHao/CALayer_Watch/blob/master/Desktop/CALayer__Watch/2248583-ee71573a7d971847.png)

![](https://github.com/zpHao/CALayer_Watch/blob/master/Desktop/CALayer__Watch/2248583-d0ce4d6727df1b6f.png)

咱们刚才绘制的秒针实际就是一个宽1，长60的一个View。咱们要让它旋转起来的时候围绕着一个点转，就要把那个点用图钉钉上。这个图钉的位置就是锚点，就是我们在代码中设置的（0.5，1）.


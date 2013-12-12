---
layout: post
title: "flash 位图优化"
description: "bitmap, bitmapdata "
category: flash
tags: [as3, optimize]
---
{% include JB/setup %}


##使用bitmap 优化内存和CPU
fp里对Bitmap 的渲染很高效，所以可以将mc转化成bitmap来展示。多个bitmap可是使用同一个bitmapdata ，而不使内存增加！
 
 
 
###资料

序列图转化bitmap
http://blog.hexagonstar.com/animatedbitmapclass/  ， https://github.com/hexagonstar/hexagonlib 项目地址

人人农场，比较全面，包括一些其他的优化方法
http://bbs.9ria.com/viewthread.php?tid=108718

​简单的mc转bitmap，简单易懂
http://bbs.9ria.com/viewthread.php?tid=79112&from=favorites
 
###使用bitmapdata.noise()和perlinNoise()制作纹理

若要修改位图的外观，可以使用 noise() 方法或 perlinNoise() 方法对位图应用杂点效果。可以把杂点效果比作未调谐的电视屏幕的静态外观。
若要对位图应用杂点效果，请使用 noise() 方法。此方法对位图图像的指定区域中的像素应用随机颜色值。
如果要创建更好的有机外观纹理，请使用 perlinNoise() 方法。perlinNoise() 方法可生成逼真、有机的纹理，是用于烟雾、云
彩、水、火或爆炸的理想图案。
由于 perlinNoise() 方法是由算法生成的，因此它使用的内存比基于位图的纹理少。但还是会对处理器的使用有影响，特别是对
于旧计算机，会降低内容的处理速度，使屏幕重绘的速度比帧速率慢。这主要是因为需要进行浮点计算，以便处理 Perlin 杂点
算法。
 
###处理像素getVector(),setVector()

setVector 比 setPixel() 或 setPixel32() 快，后者可以使用 lock() 和 unlock() 方法加快运行速度。但有时没用。
getVector比etPixel() 、getPixel32() 、setPixel() 和 setPixel32()快。
 
尽可能使用依赖于 Vector 对象的 API ，因为它们的运行速度可能更快。


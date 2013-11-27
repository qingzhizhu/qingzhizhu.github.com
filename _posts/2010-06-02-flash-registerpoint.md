---
layout: post
title: "得到元件距0，0(注册点)点的坐标"
description: "获得注册点的坐标."
category: flash
tags: [as3, flash cs]
---
{% include JB/setup %}

##对于注册点和中心点

网上的解释很多，我是这样总结的

###中心点
中心点是给美术用的，可以用来旋转和缩放。

###注册点
注册点是程序用的，用来控制位置和用代码的旋转缩放。一般放在 0,0 位置。


##获得注册点的坐标

使用`DisplayObject.getBounds()` 方法，
返回一个矩形，该矩形定义相对于 targetCoordinateSpace 对象坐标系的显示对象区域。
 
如mc 距 注册点 40，15.

	var r : Rectangle = mc.getBounds(mc);
	trace(r.x, r.y); 便可以求出！40，15
 
 
###note: 与 getRect 不同，getRect不包括图形的任何笔触区。
 
例子：
target 是mc，且注册点在- 40， -30；
 
	var bounds:Rectangle = target.getBounds(this);
	trace(bounds);    //-40，-30 ...
	var bmpData:BitmapData = new BitmapData(Math.floor(bounds.width), Math.floor(bounds.height), true, 0);
	var bmpMatrix:Matrix = target.transform.matrix;
	bmpMatrix.translate(-bounds.x, -bounds.y);    要以过来才行
	trace(bmpMatrix);
	 
	bmpData.draw(target, bmpMatrix);




---
layout: post
title: "flash 获取BitmapData最小有效矩形"
description: "getBoundsColorRect"
category: flash
tags: [as3, bitmap]
---
{% include JB/setup %}


##获取BitmapData最小有效矩形

png图片会有很多的透明区域 ，Blitting的SpriteSheet也会有这种问题，可以通过BitmapData.getBoundsColorRect(0xFF000000, 0x00000000,false) 来获得/
例子：

	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import flash.display.Bitmap;
	import flash.utils.setInterval;
	import flash.geom.Point;
	 
	var bd : BitmapData = new Test();
	trace(bd.rect);    //(x=0, y=0, w=160, h=185)
	var rect : Rectangle = bd.getColorBoundsRect(0xFF000000, 0x00000000, false);
	trace(rect);        //(x=25, y=18, w=116, h=125)
	var bd2 : BitmapData = new BitmapData(rect.width, rect.height);
	bd2.copyPixels(bd, rect, new Point(0,0));
	var bt : Bitmap = new Bitmap(bd2);
	addChild(bt);
	 
	setInterval( function(){ bt.x = Math.random()*20;}, 1000);
 
其中Test是一个有很多透明区域的png。

---
layout: post
title: "flash 碰撞测试"
description: "flash hitTest"
category: flash
tags: [as3, basic]
---
{% include JB/setup %}

##碰撞检测-api

下面使用as3 提供的api，

###DisplayObject

- hitTestPoint

`public function hitTestPoint(x:Number, y:Number, shapeFlag:Boolean = false):Boolean`

- hitTestObject

`public function hitTestObject(obj:DisplayObject):Boolean`

###BitmapData

- hitTest

`public function hitTest(firstPoint:Point, firstAlphaThreshold:uint, secondObject:Object, secondBitmapDataPoint:Point = null, secondAlphaThreshold:uint = 1):Boolean`

	var _mc1 : MovieClip = this.mc1;
	//var _mc2 : MovieClip = MovieClip( new (this.loaderInfo.applicationDomain.getDefinition("MC") as Class)() );
	 
	var _mc2 : Shape = new Shape();
	var g : Graphics = _mc2.graphics;
	g.beginFill(0, 1);
	var p : Number = -2.5;
	g.drawRect(p, p, -2*p, -2*p);
	g.endFill();
	addChild(_mc2); //无论在不在舞台都是true
	 
	_mc2.x = 200;
	_mc2.y = 110;
	 
	trace( _mc1.hitTestObject(_mc2));


##规则图形采用一些算法

对于一些规则图形，最好采用一些几何算法，这样大大降低碰撞检测耗时。

- [2D游戏中圆形与矩形碰撞检测]
- [圆与矩形碰撞]



##帮助

- [第三方库]



[第三方库]:http://www.tink.ws/blog/as-30-hittest/
[2D游戏中圆形与矩形碰撞检测]:http://blog.csdn.net/aa4790139/article/details/6395680
[圆与矩形碰撞]:http://www.apkbus.com/android-70411-1-1.html

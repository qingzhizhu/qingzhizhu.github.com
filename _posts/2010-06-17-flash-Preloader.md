---
layout: post
title: "flash Perloader, 预加载"
description: "flash 预加载."
category: flash
tags: [as3, flex]
---



##Frame(factoryClass="Preloader")]实现flex自身预加载

我们知道如果是在flash中,我们可以通过操作时间轴来实现自身的预加载.但flex没有时间轴.我们怎么办呢?下面我们给出解决方案:[Frame(factoryClass="Preloader")]实现flex自身预加载
 
	private function complete(e:Event):void
	{
		//重要..加载完后...我们跳转到第二帧
		gotoAndStop(2);
		//获取文档类...然后显示,对于此步操作..有多种方法..有人习惯直接把原文档类addChild到此类当中..
		var mainClass:Class = Class(getDefinitionByName("AsProjectLoadingExample"));
		stage.addChild(new mainClass() as DisplayObject);
		//删除此类
		destroy();
	}
	private function destroy():void
	{
		loaderInfo.removeEventListener(ProgressEvent.PROGRESS,progress);
		loaderInfo.removeEventListener(Event.COMPLETE,complete);
		parent.removeChild(this);
	}

 
[资料]:(http://www.flashas3blog.com/2011/11/framefactoryclasspreloader%E5%AE%9E%E7%8E%B0flex%E8%87%AA%E8%BA%AB%E9%A2%84%E5%8A%A0%E8%BD%BD/)
 
 
使用编译命令来设置Preloader，首先让Preloader作为启动类，然后在编译选项加入
-frame start Main， 即可。
原理和上面 的相同，也是用Main作为启动类，Preloader 是MC的子类加载。然后在反射出Main，进入游戏！
---
layout: post
title: "Event.stopPropagation(); Event.stopImmediatePropagation(); 区别"
description: "stopPropagation(), stopImmediatePropagation()"
category: flash
tags: [as3, flash]
---


##个人总结：

stopImmediatePropagation() 阻止优先级低的事件和冒泡阶段。
 
stopProgataion() 只会阻止冒泡阶段。
 
##官方的解释：

stopImmediatePropagation():void

防止对事件流中当前节点中和所有后续节点中的事件侦听器进行处理。 

stopPropagation():void

防止对事件流中当前节点的后续节点中的所有事件侦听器进行处理。


	this.addEventListener(MouseEvent.MOUSE_DOWN, funA,false,2);
	this.addEventListener(MouseEvent.MOUSE_DOWN, funB,false,1);

	function funA (evt:MouseEvent):void
	{
	       trace ("A!");
	       evt.stopImmediatePropagation ();
	}
	function funB (evt:MouseEvent):void
	{
	       trace ("B!");
	}
	输出A。
	改为：
	function funA (evt:MouseEvent):void
	{
	      trace ("A!");
	      evt.stopPropagation();
	}
	function funB (evt:MouseEvent):void
	{
	       trace ("B!");
	}
	输出A，B。


###资料
- [1](http://www.cnblogs.com/Mr-C/archive/2012/04/05/2433104.html)
- [2](http://hi.baidu.com/jianglang/blog/item/87ed5c3d66f739fb3d6d97e9.html)


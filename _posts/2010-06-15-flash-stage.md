---
layout: post
title: "flash 显示对象 Stage 和 Stage root this 区别！"
description: "flash stage, stage root this."
category: flash
tags: [as3, basic]
---
{% include JB/setup %}


##这个一定要弄明白。
[区别](http://hi.baidu.com/lixing880/blog/item/501ec8fa654b92839e5146cf.html)
 
要了解这个问题就要先对flash中的显示对象结构有一个大概的了解：
 
第一级：舞台；
第二级：当前SWF；
第三级：各种容器及可视对象（如：文本框，位图……）；、
以此类推…………
 
##Stage：

其中舞台（Stage）是最根本的容器，包含当前SWF的所有显示对象，每个flash程序只能有一个舞台容器。
所有显示对象的Stage属性指向舞台。
 
	trace(this.txt.stage);     //null
	txt.text = "?" + (this.stage == this.txt.stage);
	this.addChild(txt);
	this.txt.stage.align = "left";

	trace(this.txt.stage == stage);    //true! ,所有显示对象的stage指向舞台！
 
width, stageWidth

width 指的是 sprite的。
stageWidth 舞台的宽度，也就是当前浏览器的宽。


##root：
 
在舞台下面的也是一个容器，被称作当前SWF主类的实例（注：AS3.0中所有容器直接或间接继承自DisplayObjectContainer类），在AS3.0中，每一个SWF都和一个类相关联，这个类就称为SWF的主类，如果没有设定文档类，则MainTimeline类（注：MainTimeLine是MovieClip的子类）就是主类。而root就指向当前SWF主类的实例（注：在AS2.0中，_root.指代绝对路径）。
 
##this 就是当前对象。

 
##加载其他swf遇到的问题

在A.swf 加载B.swf里经常会报无法访问空对象，指的是B 的 stage为空。
首先要明白stage是什么意思，stage是显示对象的一个引用舞台的属性，如果显示对象不在显示列表中，即没有用addChild()添加，stage等于null，你的问题就在这里。
解决

	if(stage) init();
	else this.addEventListener(Event.ADDED_TO_STAGE, init, false, 0, true);
	 
	private function init(e:Event=null):void{
	if(e){
	this.removeEventListener(Event.ADDED_TO_STAGE, init);
	}
	//to do
	}



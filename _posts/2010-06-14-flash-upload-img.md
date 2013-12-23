---
layout: post
title: "flash 显示本地图片，假上传"
description: "flash FileReference, upload image."
category: flash
tags: [as3, basic]
---
{% include JB/setup %}


##代码：
假上传，指没有真正的服务端，而是用户选择一个本地图片，显示在游戏中。
**使用 FileReference **

	​public class LoadLocalPhoto extends Sprite
	{
	private var _file : FileReference = new FileReference();    //要声明称全局变量，以免被回收，在cs会这样
	public function LoadLocalPhoto()
	{
	init();
	}
	private function init():void{
	var _file : FileReference = new FileReference();
	_file.addEventListener(Event.SELECT, onSelect);
	// setTimeout(function():void{ _file.browse([new FileFilter("image", "*.jpg;*.png;")]); } , 2000);
	this.stage.addEventListener(MouseEvent.CLICK, function(e:Event):void{ _file.browse([new FileFilter("image", "*.jpg;*.png;")]); } );
	}
	private function onSelect(e:Event):void{
	_file = FileReference(e.target);
	trace(_file.name);
	_file.load();        //需要flash player 10.1 以上
	_file.addEventListener(Event.COMPLETE, onComp);
	_file.addEventListener(ProgressEvent.PROGRESS , onProgress);
	}
	private function onComp(e:Event):void{
	trace("loaded");
	var loader : Loader = new Loader();
	loader.loadBytes(_file.data);
	loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onImgComp);
	}
	private function onProgress(e:ProgressEvent):void{
	trace(e.bytesLoaded/e.bytesTotal);
	}
	private function onImgComp(e:Event):void{
	var info : LoaderInfo = LoaderInfo(e.target);
	trace(info.width, info.height);
	var loader : Loader = info.loader;
	trace(loader.width, loader.height);
	var data : BitmapData = new BitmapData( info.width, info.height, true, 0);
	data.draw(info.loader);
	this.addChild(new Bitmap(data));
	}
	}
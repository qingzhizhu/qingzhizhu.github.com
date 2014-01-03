---
layout: post
title: "flash tween"
description: "flash tween TimeLineLite"
category: flash
tags: [as3, flash]
---


##Tween  TimeLineLite 使用

	var txt : TextField = new TextField();
	txt.text = "12131313131321";
	txt.border = true;
	this.addChild(txt);
	var txt2 : TextField = new TextField();
	txt2.text = "12131313131321";
	txt2.border = true;
	this.addChild(txt2);
	txt2.x = 100;
	var tl = new TimelineLite();
	var mc : DisplayObject = txt;
	tl.to(mc, 1, { x:100 } ).to(mc, 1, { y:50 } );
	tl.to(txt2, 1, { alpha:0 } );


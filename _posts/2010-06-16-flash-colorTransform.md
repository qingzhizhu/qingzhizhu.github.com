---
layout: post
title: "flash 换肤操作！"
description: "flash 换肤，换颜色."
category: flash
tags: [as3, basic]
---
{% include JB/setup %}

##colorTransform 换肤操作

var mc : MovieClip = mc1;
mc.stop();
 
var rOffset:Number = 100;
var bOffset:Number = 100;
mc.transform.colorTransform = new ColorTransform(1, 1, 1, 1, rOffset, 0, bOffset, 0);
 
和cs中操作元件的 色彩效果 高级选项的操作类似。



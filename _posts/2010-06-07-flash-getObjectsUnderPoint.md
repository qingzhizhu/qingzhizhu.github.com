---
layout: post
title: "flash 得到指定点下的子项, getObjectsUnderPoint"
description: "flash getObjectsUnderPoint"
category: flash
tags: [as3, basic]
---
{% include JB/setup %}

##获取当前坐标下的显示对象

使用DisplayObject.getObjectsUnderPoint 可以实现此目的。


###优化时使用

对于多层的视图，如2.5D 多个层游戏，可以禁用所有层的鼠标事件，在最顶级添加鼠标事件，通过getObejctsUnderPoint 去做相应判断。

- 去掉鼠标事件的支持会很大挺高帧频
- blitting 也可以采用上述方法。
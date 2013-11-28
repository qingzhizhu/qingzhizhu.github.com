---
layout: post
title: "movieScript 隐藏函数 addFrameScript"
description: "MC MovieScript addFrameScript."
category: flash
tags: [as3, mc]
---
{% include JB/setup %}


##函数声明

`movieclip.addFrameScript(framenumber, function, framenumber, function...etc);`

###例子

addFrameScript(4, this.frame5);

framenumber 是从0开始的！！所以上面的4代表第5帧要执行的函数。


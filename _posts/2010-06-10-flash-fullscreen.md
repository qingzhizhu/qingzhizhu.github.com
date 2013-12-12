---
layout: post
title: "flash 全屏"
description: ""
category: flash
tags: [as3, basic]
---
{% include JB/setup %}


##flash 全屏，stage.displayStage, scaleMode, align

 
stage.displayState = (stage.displayState == "fullScreen" ) ? "normal" : "fullScreen";
注：如是在号html里报 SecurityError: Error #2152: 不允许使用全屏模式。 检查html 里 allowFullScreen  是否为true.
scaleMode 在全屏时使用 showAll, 可以参考 StageScaleMode类.
align 可以参考StageAlign类。


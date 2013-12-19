---
layout: post
title: "flash TextField 使用restrict 限定"
description: "flash TextField restrict"
category: flash
tags: [as3, basic]
---
{% include JB/setup %}


##TextField 使用restrict 限制输入的字符

	_txt_tiles.type = "input";
	_txt_tiles.maxChars = 1;    //只能输入一个
	_txt_tiles.restrict = "3-5";     //只能3.4.5


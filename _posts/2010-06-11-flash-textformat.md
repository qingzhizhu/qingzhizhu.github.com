---
layout: post
title: "flash 某字符串使用新的format"
description: "选中文字变色, defaultTextFormat 和 setTextFormat 区别"
category: flash
tags: [as3, basic]
---
{% include JB/setup %}


##TextField 选中某字符串使用新format

在jsonCheck 里用到，

	var line : int = _txt_input.getLineIndexOfChar(err.location);
	if(line > -1){
	    var start : int = _txt_input.getLineOffset(line);
	    var end : int = _txt_input.getLineLength(line) + start;
	    _txt_input.setTextFormat(new TextFormat(_txt_input.defaultTextFormat.font, _txt_input.defaultTextFormat.size, 0xFF0000, true), start, end);
	    _txt_input.addEventListener(FocusEvent.FOCUS_IN, onTxtFocusIn, false, 0, true);
	}

 
去掉赋予的format

	private function onTxtFocusIn(e:FocusEvent):void{
	    _txt_input.removeEventListener(FocusEvent.FOCUS_IN, onTxtFocusIn);
	    _txt_input.setTextFormat( _txt_input.defaultTextFormat);
	}


##TextField defaultTextFormat 和 setTextFormat 区别


defaultTextFormat  就是说把这个TextField的默认格式设成你传进来的textFormat
也就是说这个TextFiled从此      格式就变成这个 你再添加文字 还是这个格式

而setTextFormat  其实是三个参数      后面两个分别是 开始索引和结束索引
他仅仅是设置你开始索引到结束索引之间的文字的格式  
而如果你不写后面两个参数      就表示当前所有文本 注意是当前（用一次设置一次）

然而你的函数执行顺序 
label.text      = str;
在set之后      在set执行的时候 当前文本 是 “” (空字符串)
之后添加的文字      仍人是按照默认格式 所以你看起来二者就不一样了

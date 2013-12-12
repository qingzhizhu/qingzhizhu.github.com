---
layout: post
title: "flash 事件 捕获阶段"
description: ""
category: flash
tags: [as3, optimize]
---
{% include JB/setup %}


##时间的捕获阶段优化

这样的需要，一个容器内有很多子UI，如Ball，Duck或是选择联盟旗子。

在每个子UI上面添加点击事件，是比较简单的做法，但可以用事件的捕获阶段来优化这个需求。

具体代码，很简单将addEventListener 的第三个参数开启捕获阶段即可。

	containtor.addEventListener(MouseEvent.MOUSE_DOWN,onClick, true, 0, true);

	private function onClick(e:MouseEvent):void{
		if(e.target is CHILD_UI_CLASS){
			trace("bingo");
		}
	}



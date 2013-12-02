---
layout: post
title: "将显示对象灰化和胶片化"
description: "MC gray, gray image"
category: flash
tags: [as3, filter]
---
{% include JB/setup %}


主要用到ColorMatixFilter滤镜！

##显示对象变成黑白

	function applyGray(child : DisplayObject):void
	{
	    var matrix:Array = new Array();
	    matrix = [
	      0.3086, 0.6094, 0.0820, 0, 0,//red
	      0.3086, 0.6094,0.0820, 0, 0,//green
	      0.3086, 0.6094, 0.0820, 0, 0,//blue
	      0, 0, 0, 1, 0//alpha
	      ];
	 
	 
	    applyFilter(child, matrix);
	}

##变成胶片

	function applyFilm(child:DisplayObject):void{
	    var matrix : Array = [       
	        -1, 0, 0, 0, 255,
	         0,-1, 0, 0, 255,
	         0, 0,-1, 0, 255,
	         0, 0, 0, 1, 0
	         ];
	        applyFilter(child, matrix);
	}


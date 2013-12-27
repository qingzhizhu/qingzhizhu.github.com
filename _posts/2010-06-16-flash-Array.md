---
layout: post
title: "Array(obj) 是实例化新的数组！注意！"
description: "flash Array(obj) 是创建新数组."
category: flash
tags: [as3, basic]
---
{% include JB/setup %}

	var a:Array = [1, 2, 3];
	var a1:Array = Array(a); // new Array !!!
	var a2:Array = a as Array; // a1 !== a2
	 
	下面的都不会实力化， 所以在用数组显示转换时用 as！！
	var str : String= "gen";
	var s1 : String = String(str);
	trace(str == s1, str === s1);
	var o : Object = {"name":"k", "aa":[1,2,3]};
	var o1 : Object = Object(o);
	trace(o == o1, o.aa == o1.aa);
	var o2 : Object = o as Object;
	trace(o1 == o2, o1.aa == o2.aa);


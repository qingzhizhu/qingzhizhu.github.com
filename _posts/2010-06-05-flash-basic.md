---
layout: post
title: "flash 基础"
description: "flash basic, introduction"
category: flash
tags: [as3, basic]
---
{% include JB/setup %}


搜集的一些小资料。


##as3无类型变量和Object区别

但是，ActionScript 3.0 引入了无类型变量这一概念，这一类变量可通过以下两种方法来
指定：
var someObj:\*;
var someObj;
无类型变量与 Object 类型的变量不同。二者的主要区别在于无类型变量可以保存特殊值
undefined，而 Object 类型的变量则不能保存该值

<hr/>


##命名空间定义和使用

###定义

通过命名空间可以控制所创建的属性和方法的可见性。请将 public 、private、protected
和 internal 访问控制说明符视为内置的命名空间。如果这些预定义的访问控制说明符无法
满足您的要求，您可以创建自己的命名空间。
 
命名空间中包含一个名为统一资源标识符 (URI) 的值，该值有时称为命名空间名称。使用 URI 可确保命名空间定义的唯一性。

	package flash.utils
	{
		namespace flash_proxy;    //编译器将创建一个唯一的内部标识字符串来代替 URI 
	}
	//下面的代码使用 public 属性以使 flash_proxy 命名空间对该包外部的代码可见：
	package flash.utils
	{
		public namespace flash_proxy;
	}

 
###应用命名空间

应用命名空间意味着在命名空间中放置定义。可以放在命名空间中的定义包括函数、变量和常量（不能将类放在自定义命名空间中）。
 
- 对于每个声明只能应用一个命名空间。
- 不能一次将同一个命名空间属性应用于多个定义。换言之，如果您希望将自己的命名空
间应用于 10 个不同的函数，则必须将该命名空间作为属性分别添加到这 10 个函数的定
义中。 
- 如果您应用了命名空间，则不能同时指定访问控制说明符，因为命名空间和访问控制说
明符是互斥的。换言之，如果应用了命名空间，就不能将函数或属性声明为 public 、
private、protected 或 internal 。
 
###引用命名空间

1 use namespace example.
2 example::fun();
####例子：
// example/alpha 文件夹中的 Utility.as

	package example.alpha
	{
		import example.myInternal;
		public class Utility
		{
			private static var _taskCounter:int = 0;
			public static function someTask()
			{
				_taskCounter++;
			}
			myInternal static function get taskCounter():int
			{
				return _taskCounter;
			}
		}
	}


<hr/>


##as3 块级变量“提升” 和 变量默认值

这是由于存在一种名为“提升”的方法，该方法表示编译器会将所有的
变量声明移到函数的顶部。例如，下面的代码会进行编译，即使 num 变量的初始 trace() 函
数发生在声明 num 变量之前也是如此。

	trace(num); // NaN
	var num:Number = 10;
	trace(num); // 10

当然在java和c++里是错误的！
 
如果您尝试将值 undefined 赋予 Object 类型的变量，则该值会转换为 null
void 数据类型仅包含一个值：undefined
 
未声明（与类型注释 \* 等效） undefined

###Number 默认值 NaN


许多编程语言都区分基元值及其包装对象。例如，Java 中有一个 int 基元值和一个包装它的
java.lang.Integer 类。Java 基元值不是对象，但它们的包装是对象，这使得基元值对于某些
运算非常有用，而包装对象则更适合于其它运算。在 ActionScript 3.0 中，出于实用的目
的，不对基元值及其包装对象加以区分。所有的值（甚至基元值）都是对象。Flash Player
将这些基元类型视为特例 — 它们的行为与对象相似，但是不需要创建对象所涉及的正常开
销。这意味着下面的两行代码是等效的：

	var someInt:int = 3;
	var someInt:int = new int(3);







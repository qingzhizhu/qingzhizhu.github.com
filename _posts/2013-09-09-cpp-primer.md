---
layout: post
title: "C++ Primer"
description: "c++ 入门书"
category: cpp
tags: [cpp]
---
{% include JB/setup %}


开始学习C++，借了2本书，一本是21天学通C++ 第五版，另一本是 C++ Primer 第四版。

其中C++ Primer 评价很好，是C++的经典入门书，所以先从他看。


##知识点
- C++程序的后缀 有 `cc\cxx\cpp\cp\C`
- 头文件后缀 `.h \ .hpp \ .hxx` 。 使得类或其他名字的定义在多个程序中可用的一种机制，通过 `#include` 包含。
- `<<` 输出操作符
- `>>` 输入操作符, 别搞反了！
- `endl` 操纵符 (manipulator) 
- `::` 作用域操作符(scope oprator) 
- `()` 调用操作符 (operate)
- `{}` 块 block, (curly brace)
- `std::cout; std:cin` std 是命名空间
- 标准库的头文件用尖括号 `< >` 扩起来，非标准的头文件用双引号 `" "` 括起来。 
- 可打印的字符型字面值通常用一对单引号来定义: `'a'`, 在字符字面值前加 L 能得到wchar_t 类型的宽字符字面值， 如 `L'a'`.
- 为了兼容C语言，C++所有的字符串字面值有编译器自动在末尾添加一个空字符， `'A'` 表示单个字符A，然而`"A"`表示字母A和空字符两个字符的字符串。
- 多行字面值，使用程序格式化特性，在一行的尾端加一个反斜杠符号可将此行和下一行当作同一行处理。
	```
	std::cout << "a muli-line \
	string literal \
	using a backslash "
	<<std::endl;
	return 0;
	```

##小心坑
- C++ 中，把负值赋给unsigned是合法的其结果是该负数对该类型的取值个数求模后的值，如-1赋给8位的unsigned char，结果是255.
- C++ 中，初始化不是复制！初始化指创建变量并给他赋初始值，而赋值是擦除对象的当前值并用新的值代替。
- 初始化2种形式：
	```
	int ival(1024);		//direct-initialization
	int ival = 1024; 	//copy-initialization 
	```

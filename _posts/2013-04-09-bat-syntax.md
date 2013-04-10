---
layout: post
title: "FD Error while loading initial content"
description: "AS3 Mobile. AIR SDK. Error while loading initial content"
category: program
tags: [bat, other program]
---
{% include JB/setup %}


##介绍
bat是dos下的批处理文件。批处理文件是无格式的文本文件，它包含一条或多条命令。
它的文件扩展名为 .bat 或 .cmd。在命令提示下键入批处理文件的名称，或者双击该批处理文件，系统就会调用Cmd.exe按照该文件中各个命令出现的顺序来逐个运行它们。
使用批处理文件（也被称为批处理程序或脚本），可以简化日常或重复性任务。


##常用命令
echo、@、call、pause、rem(小技巧：用::代替rem)是批处理文件最常用的几个命令。

- rem 注释，这种注释是可以显示在命令行上的。
- :: 注释 这种是代码注释
- @echo off 关闭回显示
- call 用于在一个bat中调用另一个bat
- :linename 用于定义行名，主要用于 goto linename
- &gt;     执行生成文件，若不存在则创建，存在则覆盖
- &gt;&gt;  把结果从定向到文件，若文件已经存在则在末尾追加，不存在则创建。
- set varname="value" 给变量varname赋值为value，调用%varname%，一般varname大写。
- pause&exit  用于停止和用户输入任意字符关闭窗口
- %[1-9]表示参数，参数是指在运行批处理文件时在文件名后加的以空格（或者Tab）分隔的字符串。变量可以从%0到%9，%0表示批处理命令本身，其它参数字符串用%1到%9顺序表示。

###choice 使用此命令可以让用户输入一个字符（用于选择）
注意：choice命令为DOS或者Windows系统提供的外部命令，不同版本的choice命令语法会稍有不同，请用choice /?查看用法。

@echo off
set /P PARAM=请输入:
echo.
echo 刚输入%PARAM%.
pause

更多例子可以看[bat 语法和例子]。

###自动关机的例子
- <a href="/demo/bat/shutdown.bat"> shutdown.bat 试一试 <a>
- <a href="/demo/bat/shutdown.bat"> 清理垃圾 试一试 <a>

##相关链接

- [百度百科 bat文件].
- [bat 文件语法备录].
- [bat 语法和例子]
 
  [百度百科 bat文件]: http://baike.baidu.com/view/1024624.htm
  [bat 文件语法备录]: http://tristones.viaspeip.com/archives/001130.html
  [bat 语法和例子]: http://cjbskysea.blogbus.com/logs/33697954.html
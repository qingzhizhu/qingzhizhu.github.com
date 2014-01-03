---
layout: post
title: "flash SharedObject 存储位置"
description: "flash SharedObject "
category: flash
tags: [as3, flash]
---



本地文件路径（Win7）：
 
	C:\Users\Xiaogang\AppData\Roaming\Macromedia\Flash Player\#SharedObjects\MCJBTP5Y\localhost
	 
	 
	* Windows XP:
	     o For Web sites: C:\Documents and Settings\<user>\Application Data\Macromedia\Flash Player\#SharedObjects\<random code>\<domain>\<path>\<object name>.sol
	     o For AIR Applications, C:\Documents and Settings\<user>\Application Data\<AIR Application Reverse Domain Name>\Local Store\#SharedObjects\<flash filename>.swf\<object name>.sol
	* Windows Vista
	     o C:/Users/username/<user>/AppData/Roaming/Macromedia/Flash Player/#SharedObjects/<domain>/<path>/<flash filename>.swf/<object name>.sol
	* Mac OS X:
	     o For Web sites, Macintosh HD:Users:<user>:Library:Preferences:Macromedia:Flash Player:#SharedObjects:<random code>:<domain>:<path from webserver>\<object name>.sol
	     o For AIR Applications, Macintosh HD:Users:<username>:Library:Preferences:<AIR Application Reverse Domain Name>:Local Store:#SharedObjects:<flash filename>.swf\<object name>.sol
	* Linux/Unix:
	     o /home/<User>/.macromedia/Flash_Player/#SharedObjects/<domain>/<path>/<flash filename>.swf/<object name>.sol

---
layout: post
title: "强大的Sublime Text2"
description: "非常强大的文本编辑器"
category: IDE
tags: [IDE]
---
{% include JB/setup %}


Sublime Text, 强大的编辑器，个人已试用，且开启了VIM 模式.现在还在学习试用中。<br/>
https://sublimetext.com/


###快捷键
    Ctrl+L 选择整行（按住-继续选择下行）
    Ctrl+KK 从光标处删除至行尾
    Ctrl+Shift+K 删除整行
    Ctrl+Shift+D 复制光标所在整行，插入在该行之前
    Ctrl+J 合并行（已选择需要合并的多行时）
    Ctrl+KU 改为大写
    Ctrl+KL 改为小写
    Ctrl+D 选词 （按住-继续选择下个相同的字符串）, 我这里测试是删除一行.
    Ctrl+M 光标移动至括号内开始或结束的位置
    Ctrl+Shift+M 选择括号内的内容（按住-继续选择父括号）
    Ctrl+/ 注释整行（如已选择内容，同“Ctrl+Shift+/”效果）
    Ctrl+Shift+/ 注释已选择内容
    Ctrl+Z 撤销 
    Ctrl+Y 恢复撤销
    Alt+. 闭合当前标签
    Ctrl+Shift+A 选择光标位置父标签对儿
    Ctrl+Shift+[ 折叠代码
    Ctrl+Shift+] 展开代码
    Ctrl+KT 折叠性属
    Ctrl+K0 展开所有
    Ctrl+U 软撤销
    Ctrl+T 词互换
    Tab 缩进 自动完成
    Shift+Tab 去除缩进
    Ctrl+Shift+↑ 与上行互换
    Ctrl+Shift+↓ 与下行互换
    Ctrl+K+Backspace 从光标处删除至行首
    Ctrl+Enter 光标后插入行
    Ctrl+Shift+Enter 光标前插入行
    Ctrl+F2 设置书签
    F2 下一个书签
    Shift+F2 上一个书签

###中文乱码
文章参考 http://www.fuzhaopeng.com/2012/sublime-text-2-with-gb2312-gbk-support/

    1. 安装Sublime Package Control
        1. Ctrl+~打开控制台，输入以下代码， 就会自动安装。
        2. import urllib2,os; pf='Package Control.sublime-package'; ipp = sublime.installed_packages_path(); os.makedirs( ipp ) if not os.path.exists(ipp) else None; urllib2.install_opener( urllib2.build_opener( urllib2.ProxyHandler( ))); open( os.path.join( ipp, pf), 'wb' ).write( urllib2.urlopen( 'http://sublime.wbond.net/' +pf.replace( ' ','%20' )).read()); print( 'Please restart Sublime Text to finish installation')
        3. [官方提供的代码](https://sublime.wbond.net/installation#st2)
    2. Ctrl + Shift + P 打开命令行，在里面输入Install Package即可搜索需要的Package。 *输入以后可以看到下面状态条 loading.*
    3. 一般使用“ConvertToUTF8”和“GBK Encoding Support”即可正常读取和写入CJK格式的文件了。
    


###Sublime Text 2 的特色功能：
    1.良好的扩展功能，官方称之为安装包(Package)。
    2.右边没有滚动条，取而代之的是代码缩略图，这个功能非常赞
    3.强大的快捷命令“可以实时搜索到相应的命令、选项、snippet 和 syntex， 按下回车就可以直接执行，减少了查找的麻烦。”
    4.即时的文件切换。
    5.随心所欲的跳转到任意文件的任意位置。
    6.多重选择(Multi-Selection)功能允许在页面中同时存在多个光标。
    7.支持 VIM 模式
    8.支持宏，简单地说就是把操作录制下来或者自己编写命令，然后播放刚才录制的操作或者命令。
    9.更新非常勤快


###开启vim 模式
这个开启方式在Preferences：Settings - User中添加：<br/>

    "ignored_packages": [],

###安装插件

    1. 安装Markdown Preview, 编辑md文件时，可以在浏览器中预览。
    
###设置字体

Changing the font can be done via adding these lines to Preferences/Settings - User:

	"font_face": "Courier New",
	"font_size": 10
and then change as desired. The font will change when you save.



##资料
- [Sublime Text 网站]
- [从EditPlus转投Sublime Text 2]
- [Sublime Text VIM 模式]
- [Sublime Text 插件下载]
- [设置字体]

##SubLime Text 2 中文版试用
- [download]






[Sublime Text 网站]:http://www.sublimetext.com/
[从EditPlus转投Sublime Text 2]:http://android3g.diandian.com/post/2013-03-07/40048382655
[Sublime Text VIM 模式]:http://www.cnblogs.com/leohxj/archive/2012/05/23/2514956.html
[Sublime Text 插件下载]:http://wbond.net/sublime_packages
[download]:http://pan.baidu.com/share/link?shareid=3722064749&uk=2686104131
[官方提供的代码]:https://sublime.wbond.net/installation#st2
[设置字体]:http://www.sublimetext.com/docs/2/font.html

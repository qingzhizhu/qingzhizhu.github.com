---
layout: post
title: "Win7 安装Jekyll"
description: "Jekyll win7 "
category: ide
tags: [jekyll]
---
{% include JB/setup %}

##安装步骤

1. [Ruby版本 1.9]
	- Ruby 版本不要装2.0，否则会出现问题，笔者装的是1.9.3.
2. 升级DevKit
	- 下载最新的[DevKit]并双击运行解压到, 笔者使用 DevKit-tdm-32-4.5.2-20111229-1559-sfx.exe.
	- 解压DevKit 到d盘,然后执行
```Ruby
cd d:\DevKit
ruby dk.rb init	
ruby dk.rb install
```
3. 安装Jekyll，运行 `gem install jekyll` 稍等一下，自动安装.
	- 使用Jekyll --version . 笔者的是 jekyll 1.1.2.
4. 安装其他 
	- 运行`gem install rdiscount`  . 这个用来解析Markdown标记的包.


##常见问题
1. 中文！这个是最普遍的. invalid byte sequence in GB2312
	- 最简单的是在命令行执行 `chcp 65001` 可以处理utf-8字符. 笔者用这个就ok了.
	- [Jekyll 中文问题] 


##Jekyll 常用命令

1. jekyll new yoursite 创建一个Jekyll模板
2. jekyll serve 可以添加-t 参数 ，显示错误。 然后就可以在浏览器中 通过 http://localhost:4000访问
3. jekyll build 编译post




##相关资料
- [Jekyll 主页] 有时间还是看这个吧，这个是jekyll的官网，里面也有很多文档。
- [Running Jekyll on Windows] 
- Win上搭建Jekyll本地测试环境 http://www.zikercn.com/node/38 .
- Jekyll 本地调试之若干问题 http://chxt6896.github.io/blog/2012/02/13/blog-jekyll-native.html



[Jekyll 主页]: http://jekyllrb.com/
[Ruby版本 1.9]: http://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-1.9.3-p448.exe?direct
[DevKit]: https://github.com/oneclick/rubyinstaller/downloads/
[Running Jekyll on Windows]: http://www.madhur.co.in/blog/2011/09/01/runningjekyllwindows.html
[Jekyll 中文问题]: http://liouys.github.io/jekyll/2013/06/10/jekyll-usage-faq.html
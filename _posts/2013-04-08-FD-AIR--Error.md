---
layout: post
title: "FD Error while loading initial content"
description: "AS3 Mobile. AIR SDK. Error while loading initial content"
category: IDE
tags: [IDE, flash]
---
{% include JB/setup %}


使用Air 3.1 进行打包遇到 Error while loading initial content, 一般的修改application 命名空间即可，还报错就修改platform的版本号。


##单次修改
用FD建立一个AIR Mobile项目，运行报错 Error while loading initial content。
解决方式，修改application.xml 的命名空间。
<application xmlns=”http://ns.adobe.com/air/application/3.1″>。


如果还报错，点击project->properties 修改platform的版本号。这样就ok了。
<img src="/images/changePlatform.jpg" alt="修改platform">

##修改FD文件夹的摸板文件，一劳永逸

###修改命名空间
open FD install position, like C:\Program Files\FlashDevelop\Projects\190 ActionScript 3 - AIR Mobile AS3 App\application.xml.template
modify application namespace.

###修改platform minorVersion
open file like  C:\Program Files\FlashDevelop\Projects\190 ActionScript 3 - AIR Mobile AS3 App\Project.as3proj
find minorVersion. change to yourself num.



##相关链接

- [FD论坛帖子].
 
  [FD论坛帖子]: http://www.flashdevelop.org/community/viewtopic.php?p=47059 
  
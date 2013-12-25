---
layout: post
title: "Air 手机项目不能启动"
description: "Air 手机项目不能调试 启动"
category: flash
tags: [air]
---
{% include JB/setup %}


## Air 项目一直不能启动的原因
是swc中有中文链接名.......

花了近2个小时才将项目启动.

##过程
早晨更新代码，用FD运行，命令行上直接说 
```
ERROR: Application ID in 'bat\SetupApplication.bat' (APP_ID) does NOT match Application descriptor 'application.xml' (id)
请按任意键继续. . .
```

就是不进项目。

首先APP_ID 和 application.xml 的 id 相同。想到最近在搞Jekyll，改过dos的字符集，是不是跟这个有关系？
```
chch 936
```
没有报Error，但还是 “请按任意键继续. . .”。

然后使用FB来调试项目，直接报错:

<img src="/images/fb_err.jpg" alt="FB 报错">


然后我确定不是编译环境的错误，在网上到了[AIR 进程终止], 才看今天的更新记录，果然有个swc中文。


##结论
1. 在遇到这种问题不要怀疑是编译环境错误。
2. 寻找资源文件，如图片，swc中是否有中文。
3. 换AIR sdk 试试。






[AIR 进程终止]:http://blog.csdn.net/xbdf1234/article/details/8593663

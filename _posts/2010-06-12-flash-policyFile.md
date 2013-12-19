---
layout: post
title: "flash 策略文件"
description: "getBoundsColorRect"
category: flash
tags: [as3, basic]
---
{% include JB/setup %}


##关于安全沙箱 策略文件

参考资料： http://help.adobe.com/zh_CN/ActionScript/3.0_ProgrammingAS3/WS5b3ccc516d4fbf351e63e3d118a9b90204-7e08.html

                    
在微博里请求数据遇到完全沙箱问题...
 
还是不理解具体的沙箱机制。
SWF 文件可以通过调用 Security.loadPolicyFile() 方法检索其它策略文件名或其它目录位置。但是，如果主策略文件未指定目标位置能提供策略文件，则调用 loadPolicyFile() 无效，即使该位置有策略文件。
URL 策略文件范围
URL 策略文件仅适用于从其中加载该文件的目录及其子目录。根目录中的策略文件适用于整个服务器；而从任意子目录加载的策略文件仅适用于该目录及其子目录。

预加载策略文件
从服务器加载数据或连接到套接字是一种异步操作。Flash Player 只是等待策略文件完成下载，然后才开始主操作。但是，从图像中提取像素数据或从声音中提取采样数据是一种同步操作。必须先加载策略文件才能提取数据。



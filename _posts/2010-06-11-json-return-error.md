---
layout: post
title: "json 字符里不能有\n\t 否则会不能解析"
description: ""
category: json
tags: [josn]
---
{% include JB/setup %}


例子：
	"{\n\t"response_service":"CompleteMission",\n\t"call_id":"call_9",\n\t"response_code":2052,\n\t"error_msg":"Mission RankPFC not completed yet: Control Control not large enough,\n\t were 76 required to be 80",\n\t"error_data":{\n\t\t"mission_name":"RankPFC"\n\t},\n\t"data":{\n\t}\n}\n"    
 
在error_msg字符串里有\n\t 所以报错，去掉就可以

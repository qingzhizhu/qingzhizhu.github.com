---
layout: post
title: ! 'Git : git 分支 '
description: "git branch , git 分支"
tags: [git]
category : git
status: publish
type: post
published: true
---
{% include JB/setup %}


git 的分支很强大。先看看做的测试：


**source tree 图表**

<img src="/images/git/source_tree_merge1.jpg" alt="source tree 图表" />

<br/>

**smart git 图表**

<img src="/images/git/smartgit_merge1.jpg" alt="smart git 图表" />

---

##一些基本的命令

###checkout

- 切换一个分支			`git checkout name`		
- 建立并切换到该分支	`git checkout -b name`		

###branch

- 查看分支			`git branch -a`
- 查看远程分支			`git branch -r`
- 建立分支			`git branch name`
- 删除分支			`git branch -d name`
- 删除远程分支			`git push origin --delete name`

###merge

- git merge --no-ff "from" "to"


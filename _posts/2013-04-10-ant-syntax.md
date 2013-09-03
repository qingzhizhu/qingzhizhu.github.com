---
layout: post
title: "Eclipse Ant 使用，简单语法总结"
description: "Eclipse ant. ant. ant syntax. use ant."
category: program
tags: [ant, other program]
---
{% include JB/setup %}


##介绍

Apache Ant，是一个将软件编译、测试、部署等步骤联系在一起加以自动化的一个工具，大多用于Java环境中的软件开发。
由Apache软件基金会所提供。默认情况下，它的buildfile(XML文件)名为build.xml。
每一个buildfile含有一个`<project>`和至少一个默认的`<target>`，这些targets包含许多task elements。
每一个task element有一个用来被参考的id，此id必须是唯一的。


##常用命令

1.ant的编译文件默认为build.xml，一般无需改变。<br/>
2.build.xml的根节点为`<project>`，一般格式如下：   
:    `<project name="AntStudy" default="init" basedir=".">` <br/>
   name为工程名称；<br/>
   default为默认的target，就是任务；<br/>
   basedir就是基路径。一般为"."<br/>

3.property可以定义变量，一般格式如下：<br/>
:   `<property name="test" value="shit" />` <br/>
   引用的时候这么引用${test} <br/>
   如果变量是路径的话，则可以这么定义：<br/>
   `<property name="src" value="src" />`<br/>
   这么定义就可以不用担心"\"和"/"的问题了。

4.定义target：<br/>
:   `<target name="compile" depends="init"><!--other command--></target>`<br/>
   name的值为target的名称，可以在编译的时候指定是完成哪个target，<br/>
   否则采用project那里定义的default。<br/>
   depends则定义了依赖关系，值为其他target的name。多个依赖关系用","隔开，<br/>
   顺序执行完定义的依赖关系，才会执行这个target。<br/>
   target在build.xml中定义的顺序无所谓，但是depends中的顺序必须正确。<br/>

5.编译源代码：<br/>
:   `<javac srcdir="src" destdir="classes">
     <classpath> 
             <fileset dir="lib"> 
                 <include name="**/*.jar"/> 
             </fileset>
         </classpath> 
   </javac>`
   这个标签自动寻找src中以.java为扩展名的文件，并且调用javac命令。<br/>
   这个任务有个特点，它仅仅编译那些需要编译的源文件。如果没有更新，就不需要编译，
   速度就加快。
   编译文件和ant使用的同一个jvm，大大减少资源浪费。
   还可以指定classpath。classpath中指定文件夹，然后指定包含的文件的规则。

6.创建jar文件：<br/>
:   `<jar destfile="antstudy.jar" basedir="classes">
<manifest>
   <attribute name="Main-Class" value="bean.ant.TestAnt" />
</manifest>
   </jar>`
   manifest指定manifest中文件的属性，比如可以指定Main-Class<br/>

7.创建目录：
:   `<mkdir dir="classes" />`<br/>
   创建dir的文件夹。

8.删除目录：
:   `<delete dir="classes" />`<br/>
   删除classes文件夹

9.拷贝文件：
:    `<copy todir="${backup.dir}"> 
        <fileset dir="${classes.dir}"/> 
    </copy>`
    把fileset文件夹下面的所有文件拷贝到 backup.dir

10.执行一个类：
:    `<java dir="${build}" classname="bean.ant.TestAnt" fork="true" />`<br/>
    dir为工作文件夹，classname为类名。fork要设置为true。因为你编译放class的文件夹
    正在使用，所以要新打开一个虚拟机。

11.生成javadoc：
: `<javadoc sourcepath="${src}" destdir="${docs}/javadoc" encoding="utf-8" charset="utf-8" 
windowtitle="Spring Framework" source="1.5" access="package" author="true" version="true" 
use="true" defaultexcludes="true">
<doctitle>
   <![CDATA[<h1>Ant Test</h1>]]></doctitle>
<bottom>
   <![CDATA[<i>Copyright (c) 2002-2007</i>]]></bottom>
<packageset dir="${src}">
   <include name="bean/ant/**" />
</packageset>
</javadoc>` <br/>
`encoding="utf-8" charset="utf-8"` 都需要，否则javadoc是乱码。<br/>
packageset一定要设定，否则找不到源码，格式可以是`**`.意思是所有源码。<br/>

12.path的使用，可以定义path对象，在其他地方可以直接复用。
: `<path id="1"> 
   <pathelement location="."/> 
   <pathelement location="./lib/junit.jar"/> 
</path>
<path id="2"> 
   <fileset dir="lib"> 
   <include name="**/*.jar"/> 
   </fileset> 
</path>
<javac srcdir="./src" destdir="./classes"> 
   <classpath refid="1"/> 
</javac>
<javac srcdir="./src" destdir="./classes"> 
      <classpath refid="1"> 
          <pathelement location="."/> 
          <pathelement location="./lib/junit.jar"/> 
      </classpath> 
</javac>`

13.单元测试：
: `<junit printsummary="yes">
   <classpath refid="testpath" />
   <batchtest>
    <fileset dir="${test}">
     <include name="**/*Test.java" />
    </fileset>
   </batchtest>
</junit>` <br/>
    batchtest为批量test，需要设置符合条件的类名称。<br/>
    在进行单元测试之前必须先进行编译。<br/>
    配置的classpath指向一个testpath的path，就是上面哪一条里面讲的。<br/>
    一开始会报一个找不到junit的错误，可以用下面方法解决：<br/>
    Windows>>Preference>>Ant>>Runtime>>Classpath<br/>
    添加一个junit.jar 在 eclipse home\plugins\org.junit_3.8.1可以找到。<br/>

##相关链接

- [eclipse use ant demo]
- [ant的基本语法]
- [WIKI apache ant]
- [apache ant download]

  [WIKI apache ant]: http://en.wikipedia.org/wiki/Apache_Ant
  [apache ant download]: http://ant.apache.org/
  [eclipse use ant demo]: http://cjbskysea.blogbus.com/logs/33697954.html
  [ant的基本语法]: http://252401762.iteye.com/blog/312422

---
layout: post
title: "CocosBuilder "
description: "CocosBuilder 入门, cocos2d-x"
category: cpp
tags: [cpp]
---
{% include JB/setup %}

用cocosbuilder 做见面遇到了很多问题,其中问题很诡异，感觉是项目的设置有问题，在此记录一下。

测试环境：
- Xcode 4.6.2
- cocos2d-x 2.1.5
- CocosBuilder 3.0-alpha5

##参考文章 
[喜气洋洋的一步一步cocosbuilder](http://young40.github.io/blog/2012/12/21/cocosbuilder-step-by-step-part-one/)
文章4篇写的很详细，我在众多的参考文章里，觉得这个是最好的。

###补充点
- 设置是否是JsControl 可以在Document 最下面勾选。


##注意点

- [cocosBuilder 下载] ,要使用3.0版本，要不对应的cocos2d-x项目会报错。
- 在Xcode 中连接资源选择使用 `Create groups for any added folders`，可能是和项目的设置有问题，我选择 `create folder refernces` 就会出现界面总是前一个版本的。
- 如果在ccb中定义了属性名，Xcode总是获取不到，就删掉ccb的资源目录，重复上一步操作。
- 文件有残留，即使将他清理到废纸桶。在XCode里选择windows-organizer-protect-delete，清楚虚拟机设备的数据
- 添加一个新的ccb，需要在Xcode理重新联盟资源
- 最好做的时候结合Xcode运行看看到底对不对，否则不对以后又要重新制作，我就在锚点上弄错了，导致很多的元件位置都飞了。
- 建立单独的ccb，如Item，单独元件，要设置最外层CCLayer的具体尺寸。不要用100%。

###结合TexturePacker

- texture 发布在Xcode项目的resource的ccbResources 中
- 新建的CCB 链接Xcode的ccbResources 中,在`File 的 Project Setting `链接
- CCB发布路径在Xcode项目的resource的ccbi文件夹中
- CCB发布选择 `Only publish ccb-files` 和 `Flatten paths when publish`.	


##命名 
- img 代表CCSprite 代表一张图片
- lbl 代表CCLabel 
- lay 代表CCLayer




##代码
用CocosBuilder 发布 .ccbi 文件，在项目里显示。


###最简单的显示
可以快速查看效果,原理是建立一个scene，添加一个通过CCBReader读取的ccbi 返回的CCNode。

头文件

```Cpp
	#ifndef __BattleAlertUI__HeadLayer__
	#define __BattleAlertUI__HeadLayer__

	#include "cocos2d.h"
	#include "cocos-ext.h"

	class HeadLayer
	{
	public:
	    static cocos2d::CCScene* scene();
	};

	#endif /* defined(__BattleAlertUI__HeadLayer__) */
```

c++文件

```Cpp
	#include "HeadLayer.h"

	USING_NS_CC;
	USING_NS_CC_EXT;

	CCScene* HeadLayer::scene()
	{
	    CCScene *scene = CCScene::create();
	    
	    CCNodeLoaderLibrary *lib = CCNodeLoaderLibrary::newDefaultCCNodeLoaderLibrary(); //生成一个默认的Node Loader
	    
	    CCBReader *reader = new CCBReader(lib); //用node load lib 初始化一个ccb reader
	    
	    CCNode *node = reader->readNodeGraphFromFile("gui.ccbi", scene); //从ccbi文件中加载node
	    
	    reader->release(); //注意手动释放内存
	    
	    if (node!=NULL)
	    {
	        scene->addChild(node); //将node 添加到scene中
	    }
	    
	    return scene;
	}
```

###ccbi文件和类的绑定

- 在CCB中将根节点的`Custom class`设置为`HeadLayer`.
- 让HeadLayer.h继承CCLayer。`: public cocos2d::CCLayer`
- 并添加一个新函数 `CCB_STATIC_NEW_AUTORELEASE_OBJECT_WITH_INIT_METHOD(HeadLayer, create);`
- HeadLayer.h中添加一个新类HeadLayerLoader代码如下:

```cpp
	class HeadLayerLoader : public cocos2d::extension::CCLayerLoader
	{
	public:
	    CCB_STATIC_NEW_AUTORELEASE_OBJECT_METHOD(HeadLayerLoader, loader);
	protected:
	    CCB_VIRTUAL_NEW_AUTORELEASE_CREATECCNODE_METHOD(HeadLayer);
	};
	```
	- 然后我们在HeadLayer.cpp中添加一行注册将ccb文件和类绑定起来.
	```cpp
	lib->registerCCNodeLoader("HeadLayer", HeadLayerLoader::loader());
```



###控件和变量的绑定

-变量类型有三种
	- Don`t assign:不分配
	- Doc root var:从属于根对象所属类型
	- Owner var:从属于指定类型
- 我们先在CCB中给CCLabelTTF添加一个Doc root var类型的绑定lbl. 添加一个叫lbl_coin.
- 然后在Xcode中给HeadLayer.h增加一个从CCBMemberVariableAssigner的继承并实现其虚函数. 并且添加相应的变量. 

```cpp
	class HeadLayer
	: public cocos2d::CCLayer //从CCLayer派生
	, public cocos2d::extension::CCBMemberVariableAssigner
	{
	public:
	    HeadLayer();
	    ~HeadLayer();
	    static cocos2d::CCScene* scene();
	    
	    CCB_STATIC_NEW_AUTORELEASE_OBJECT_WITH_INIT_METHOD(HeadLayer, create);

	    virtual bool onAssignCCBMemberVariable(cocos2d::CCObject* pTarget, const char* pMemberVariableName, cocos2d::CCNode* pNode);
	private:
	    cocos2d::CCLabelTTF *mLbl;
	    cocos2d::CCLabelTTF *mLblCoin;

	};
```

- 在HeadLayer.cpp 添加
需要注意的是, 由于绑定较晚, 所以无法在init函数中使用变量mLbl.
```cpp
	HeadLayer::HeadLayer()//构造函数
	: mLbl(NULL), mLblCoin(NULL)
	{}

	HeadLayer::~HeadLayer()
	{
	    CC_SAFE_DELETE(mLbl);
	    CC_SAFE_DELETE(mLblCoin);
	}

	bool HeadLayer::onAssignCCBMemberVariable(cocos2d::CCObject *pTarget, const char *pMemberVariableName, cocos2d::CCNode *pNode)
	{
	    CCB_MEMBERVARIABLEASSIGNER_GLUE(this, "lbl", CCLabelTTF*, this->mLbl);
	    CCB_MEMBERVARIABLEASSIGNER_GLUE(this, "lbl_coin", CCLabelTTF*, this->mLblCoin);
	    return true;
	}
```

###增加CCNodeLoaderListener，类似于flash的added_to_stage事件.
- 在HeadLayer类继承 `, public cocos2d::extension::CCNodeLoaderListener`
- 实现方法 `virtual void onNodeLoaded(cocos2d::CCNode * pNode, cocos2d::extension::CCNodeLoader * pNodeLoader);`
- 在HeadLayer.cpp中添加

```cpp
	void HeadLayer::onNodeLoaded(cocos2d::CCNode *pNode, cocos2d::extension::CCNodeLoader *pNodeLoader)
	{
	    this->mLbl->setString("Hello 我！");
	}

```


###事件和函数的绑定
- HeadLyaer.h 继承 `, public cocos2d::extension::CCBSelectorResolver`
- 显示虚方法:
```cpp
	virtual cocos2d::SEL_MenuHandler onResolveCCBCCMenuItemSelector(cocos2d::CCObject * pTarget, const char* pSelectorName);
	virtual cocos2d::extension::SEL_CCControlHandler onResolveCCBCCControlSelector(cocos2d::CCObject * pTarget, const char* pSelectorName);

	void onButtonTest(cocos2d::CCObject *pSender, cocos2d::extension::CCControlEvent pCCControlEvent);
```
- HeadLayer.cpp 实现方法
```cpp
	SEL_MenuHandler HeadLayer::onResolveCCBCCMenuItemSelector(cocos2d::CCObject *pTarget, const char *pSelectorName)
	{
	    return NULL;
	}

	SEL_CCControlHandler HeadLayer::onResolveCCBCCControlSelector(cocos2d::CCObject *pTarget, const char *pSelectorName)
	{
	    CCB_SELECTORRESOLVER_CCCONTROL_GLUE(this, "onButtonTest", HeadLayer::onButtonTest);
	    
	    return NULL;
	}

	void HeadLayer::onButtonTest(cocos2d::CCObject *pSender, cocos2d::extension::CCControlEvent pCCControlEvent)
	{
	    this->mLbl->setString("Hello CocosBuilder!!!");
	}
```





[cocosBuilder 下载]:http://cocosbuilder.com/




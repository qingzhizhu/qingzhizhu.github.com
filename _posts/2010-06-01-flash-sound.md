---
layout: post
title: "关闭所有音乐和Event.SOUND_COMPLETE事件"
description: "关闭所有音乐."
category: flash
tags: [as3, sound]
---
{% include JB/setup %}

##关闭所有音乐
	`SoundMixer.stopAll();`停止当前正在播放的所有声音。

这个是静音

	if(SoundMixer.soundTransform.volume){
		SoundMixer.soundTransform = new SoundTransform(0);
	}else{
		SoundMixer.soundTransform = new SoundTransform(1);
	}


##音乐的loops和Event.SOUND_COMPLETE事件

Sound.play(0, loops); // loops <=1 只播放1次.
 
Sound.play(0, 5);会在5次播放完后调用 SOUND_COMPLETE 事件！

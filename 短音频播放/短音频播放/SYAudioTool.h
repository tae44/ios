//
//  SYAudioTool.h
//  短音频播放
//
//  Created by jason on 2016/11/10.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"

@interface SYAudioTool : NSObject

singleton_interface(SYAudioTool);

/**
 通过MP3的名字播放音频

 */
- (void)playMP3WithName:(NSString *)mp3Name;

@end

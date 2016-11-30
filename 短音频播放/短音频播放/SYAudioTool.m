//
//  SYAudioTool.m
//  短音频播放
//
//  Created by jason on 2016/11/10.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYAudioTool.h"
#import <AudioToolbox/AudioToolbox.h>

/**存储所有音频文件的SystemSoundID*/
static NSDictionary *soundDict;

@implementation SYAudioTool

singleton_implementation(SYAudioTool);

+ (void)initialize {
    // 加载所有音频文件
    // 遍历plane.bundle的所有音频文件
    NSFileManager *mgr = [NSFileManager defaultManager];
    // 获取plane.bundle的路径
    NSString *planePath = [[NSBundle mainBundle] pathForResource:@"plane.bundle" ofType:nil];
    NSArray *contents = [mgr contentsOfDirectoryAtPath:planePath error:nil];
    // 遍历里面的mp3文件,创建SystemSoundID
    NSMutableDictionary *soundDictM = [NSMutableDictionary dictionary];
    for (NSString *mp3Name in contents) {
        // 音频文件的URL
        NSString *soundURLStr = [planePath stringByAppendingPathComponent:mp3Name];
        NSURL *soundURL = [NSURL fileURLWithPath:soundURLStr];
        // 音频ID,一个音频文件对应一个soundID
        SystemSoundID soundID;
        AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)(soundURL), &soundID);
        // 通过字典存储soundID
        soundDictM[mp3Name] = @(soundID);
    }
    soundDict = soundDictM;
}

- (void)playMP3WithName:(NSString *)mp3Name {
    // 通过键值获取soundId
    SystemSoundID soundID = [soundDict[mp3Name] unsignedIntValue];
    // 播放
    AudioServicesPlaySystemSound(soundID);
    // 振动
    // AudioServicesPlayAlertSound(<#SystemSoundID inSystemSoundID#>)
}

@end

//
//  ViewController.m
//  短音频播放
//
//  Created by jason on 2016/11/10.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import "SYAudioTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[SYAudioTool sharedSYAudioTool] playMP3WithName:@"enemy3_down.mp3"];
}

- (void)test {
    // 音频文件的URL
    NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"/plane.bundle/enemy1_down.mp3" withExtension:nil];
    // 音频ID,一个音频文件对应一个SoundID
    SystemSoundID soundID;
    // 加载音频文件到内存
    AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)(soundURL), &soundID);
    // 播放音频
    AudioServicesPlaySystemSound(soundID);
}

@end

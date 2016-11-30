//
//  ViewController.m
//  长MP3播放
//
//  Created by jason on 2016/11/10.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController () <AVAudioPlayerDelegate>
/**播放时间滑块*/
@property (weak, nonatomic) IBOutlet UISlider *timeSlider;

@property (nonatomic, strong) AVAudioPlayer *player;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 获取mp3的路径
    NSURL *mp3URL = [[NSBundle mainBundle] URLForResource:@"bb.mp3" withExtension:nil];
    // 创建音乐播放器
    AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:mp3URL error:nil];
    // 准备播放
    [player prepareToPlay];
    // 打开可以改变速率的开关
    player.enableRate = YES;
    // 播放次数,0代表播放一次,1代表播放2次...
    player.numberOfLoops = 0;
    player.delegate = self;
    self.player = player;
    // 设置timeSlider的最大值
    self.timeSlider.maximumValue = self.player.duration;
    // 监听音乐的中断
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleInterruption:) name:AVAudioSessionInterruptionNotification object:session];
}

/**
 处理中断
 */
- (void)handleInterruption:(NSNotification *)noti {
    NSLog(@"%@", noti.userInfo);
    // AVAudioSessionInterruptionTypeKey = 1  开始中断
    // AVAudioSessionInterruptionTypeKey = 0  结束中断
}

/**
 停止按钮
 */
- (IBAction)stop {
    [self.player stop];
    // 自己指定播放的时候到0的位置
    self.player.currentTime = 0;
}

/**
 开始按钮
 */
- (IBAction)play {
    [self.player play];
}

/**
 暂停按钮
 */
- (IBAction)pause {
    [self.player pause];
}

/**
 播放时间变化
 */
- (IBAction)timeChange:(UISlider *)sender {
    self.player.currentTime = sender.value;
}

/**
 播放声音变化
 */
- (IBAction)volumnChange:(UISlider *)sender {
    self.player.volume = sender.value;
}

/**
 播放速度变化
 */
- (IBAction)rateChange:(UISlider *)sender {
    self.player.rate = sender.value;
}

#pragma mark - AVAuidoPalyer的代理

#pragma mark 音乐播放完成后调用

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    NSLog(@"%s",__func__);
}

// 下面的方法,在ios8已经过期

//#pragma mark 中断(电话进来)
//
//- (void)audioPlayerBeginInterruption:(AVAudioPlayer *)player {
//    NSLog(@"%s",__func__);
//    [self.player pause];
//}
//
//#pragma mark 停止中断(电话挂了)
//
//- (void)audioPlayerEndInterruption:(AVAudioPlayer *)player {
//    NSLog(@"%s",__func__);
//    [self.player play];
//}

@end

//
//  ViewController.m
//  听书(歌词同步)
//
//  Created by jason on 2016/11/10.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"
#import "MJExtension.h"
#import "SYWord.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController () <AVAudioPlayerDelegate>
/**所有的诗词*/
@property (nonatomic, strong) NSArray *words;
/**背景音乐播放器*/
@property (nonatomic, strong) AVAudioPlayer *bgPlayer;
/**诗词播放器*/
@property (nonatomic, strong) AVAudioPlayer *wordsPlayer;
/**定时器*/
@property (nonatomic, strong) CADisplayLink *link;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 播放两个音频文件,一个音频文件对应一个AVAudioPlayer
    NSURL *bgURL = [[NSBundle mainBundle] URLForResource:@"Background.caf" withExtension:nil];
    self.bgPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:bgURL error:nil];
    // 设置播放次数
    self.bgPlayer.numberOfLoops = 5;
    [self.bgPlayer prepareToPlay];
    [self.bgPlayer play];
    NSURL *wordURL = [[NSBundle mainBundle] URLForResource:@"一东.mp3" withExtension:nil];
    self.wordsPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:wordURL error:nil];
    self.wordsPlayer.delegate = self;
    [self.wordsPlayer prepareToPlay];
    [self.wordsPlayer play];
    // 开启定时器
    [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

- (NSArray *)words {
    if (!_words) {
        _words = [SYWord objectArrayWithFilename:@"一东.plist"];
    }
    return _words;
}

- (CADisplayLink *)link {
    if (!_link) {
        _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateWords)];
    }
    return _link;
}

#pragma mark - tableview的数据源

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.words.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"word";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.textLabel.text = [self.words[indexPath.row] text];
    return cell;
}

/**
 刷新诗词读的进度
 */
- (void)updateWords {
    double currentTime = self.wordsPlayer.currentTime;
    // 总的句数
    NSInteger numberOfWord = self.words.count;
    for (NSInteger i = numberOfWord - 1; i >= 0; i--) {
        SYWord *word = self.words[i];
        if (currentTime >= word.time) {
            [self selectCellWithIndex:i];
            break;
        }
    }
}

/**
 选中表格
 */
- (void)selectCellWithIndex:(NSInteger)index {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
}

#pragma mark - AudioPlayer代理

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    // 当诗词播放完成后,背景音乐停止
    [self.bgPlayer stop];
    // 定时器也要移除
    [self.link removeFromRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

@end

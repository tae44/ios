//
//  ViewController.m
//  录音
//
//  Created by jason on 2016/11/10.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>
/**录音器*/
@property (nonatomic, strong) AVAudioRecorder *recorder;
/**音频数据(存文件路径)*/
@property (nonatomic, strong) NSMutableArray *data;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

/**
 开始录音
 */
- (IBAction)startRecord {
    // 创建日期字符串
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyyMMddHHmmss";
    NSString *timeStr = [dateFormatter stringFromDate:[NSDate date]];
    // 音频文件名
    NSString *audioName = [timeStr stringByAppendingString:@".caf"];
    // doc目录
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    // 拼接音频URL
    NSString *fileURL = [doc stringByAppendingPathComponent:audioName];
    // 保存文件路径到数组
    [self.data addObject:fileURL];
    // setting录音设置
    NSMutableDictionary *settings = [NSMutableDictionary dictionary];
    // 音频编码格式
    settings[AVFormatIDKey] = @(kAudioFormatAppleIMA4); //音频采样频率
    settings[AVSampleRateKey] = @(8000.0);
    // 音频频道
    settings[AVNumberOfChannelsKey] = @(1);
    // 音频线性音频的位深度
    settings[AVLinearPCMBitDepthKey] = @(8);
    self.recorder = [[AVAudioRecorder alloc] initWithURL:[NSURL fileURLWithPath:fileURL] settings:settings error:nil];
    // 录音准备
    [self.recorder prepareToRecord];
    // 开始录音
    [self.recorder record];
}

/**
 结束录音
 */
- (IBAction)endRecord {
    // 录音的时间
    double duration = self.recorder.currentTime;
    [self.recorder stop];
    // 判断录音时间是否大于0.5秒
    if (duration <= 0.5) {
        // 移除最后的录音文件
        [self.data removeLastObject];
    } else {
        // 刷新表格
        [self.tableView reloadData];
    }
}

#pragma mark tableView数据源

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"record";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.textLabel.text = [self.data[indexPath.row] lastPathComponent];
    return cell;
}

@end

//
//  ViewController.m
//  距离传感器
//
//  Created by jason on 2016/11/1.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 打开距离传感器,默认是关闭状态(需要实时监听是否有物品靠近,非常耗电)
    // [UIApplication sharedApplication].proximitySensingEnabled
    [UIDevice currentDevice].proximityMonitoringEnabled = YES;
    // 监听是否有物品靠近
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(proximityStateDidChange) name:UIDeviceProximityStateDidChangeNotification object:nil];
}

/**
 *  当距离传感器的状态发生改变的时候
 */
- (void)proximityStateDidChange {
    if ([UIDevice currentDevice].proximityState) {
        NSLog(@"有物品靠近");
    } else {
        NSLog(@"有物品离开");
    }
}

@end

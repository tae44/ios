//
//  CZAwardAnimViewController.m
//  NetEaseLotterry
//
//  Created by Vincent_Guo on 14-9-4.
//  Copyright (c) 2014年 vgios. All rights reserved.
//  中奖动画

#import "CZAwardAnimViewController.h"

@interface CZAwardAnimViewController ()

@end

@implementation CZAwardAnimViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CZSettingSwitchItem *anim = [CZSettingSwitchItem settingItemWithTitle:self.title];
    
    CZSettingGroup *group = [[CZSettingGroup alloc] init];
    group.items = @[anim];
    group.headerTitle = @"当您有新中奖订单，启动程序时通过动画提醒您。为避免过于频繁，高频彩不会提醒。";
    [self.data addObject:group];
}


@end

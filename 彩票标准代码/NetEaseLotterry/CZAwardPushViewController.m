//
//  CZAwardPushViewController.m
//  NetEaseLotterry
//
//  Created by Vincent_Guo on 14-9-4.
//  Copyright (c) 2014年 vgios. All rights reserved.
//  开奖推送

#import "CZAwardPushViewController.h"

@interface CZAwardPushViewController ()

@end

@implementation CZAwardPushViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CZSettingSwitchItem *item1 = [CZSettingSwitchItem settingItemWithIcon:nil title:@"双色球" vcClass:nil];
    CZSettingSwitchItem *item2 = [CZSettingSwitchItem settingItemWithIcon:nil title:@"大乐透球" vcClass:nil];
    
    CZSettingGroup *group = [[CZSettingGroup alloc] init];
    group.items = @[item1,item2];
    group.headerTitle = @"打开设置即可在开奖后立即收到推送消息，获知开奖号码";
    
    
    [self.data addObject:group];
    
}



@end

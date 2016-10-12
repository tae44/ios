//
//  CZBuyTimedNoticeViewController.m
//  NetEaseLotterry
//
//  Created by Vincent_Guo on 14-9-4.
//  Copyright (c) 2014年 vgios. All rights reserved.
//

#import "CZBuyTimedNoticeViewController.h"

@interface CZBuyTimedNoticeViewController ()

@end

@implementation CZBuyTimedNoticeViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    CZSettingSwitchItem *notice = [CZSettingSwitchItem settingItemWithTitle:@"打开提醒"];
    
    CZSettingGroup *group = [[CZSettingGroup alloc] init];
    group.items = @[notice];
    group.headerTitle = @"您可以通过设置，提醒自己在开奖日不要忘了购买彩票";
    [self.data addObject:group];
}



@end

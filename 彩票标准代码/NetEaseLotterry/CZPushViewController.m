//
//  CZSettingViewController.m
//  NetEaseLotterry
//
//  Created by Vincent_Guo on 14-9-2.
//  Copyright (c) 2014年 vgios. All rights reserved.
//

#import "CZPushViewController.h"
#import "CZProductsViewController.h"
#import "CZAwardPushViewController.h"
#import "CZAwardAnimViewController.h"
#import "CZScoreLiveNoticeViewController.h"
#import "CZBuyTimedNoticeViewController.h"

@implementation CZPushViewController


-(void)setupGroup1{
    //第一组
    CZSettingArrowItem *item1 = [CZSettingArrowItem settingItemWithIcon:nil title:@"开奖号码推送" vcClass:[CZAwardPushViewController class]];
    CZSettingArrowItem *item2 = [CZSettingArrowItem settingItemWithIcon:nil title:@"中奖动画" vcClass:[CZAwardAnimViewController class]];
    CZSettingArrowItem *item3 = [CZSettingArrowItem settingItemWithIcon:nil title:@"比分直播提醒 " vcClass:[CZScoreLiveNoticeViewController class]];
    
    CZSettingArrowItem *item4 = [CZSettingArrowItem settingItemWithIcon:nil title:@"购彩定时提醒" vcClass:[CZBuyTimedNoticeViewController class]];
    
    CZSettingGroup *group1 = [[CZSettingGroup alloc] init];
    group1.items = @[item1,item2,item3,item4];
    
    [self.data addObject:group1];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupGroup1];
}


@end

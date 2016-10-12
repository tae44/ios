//
//  SYScoreLiveWarnningViewController.m
//  彩票
//
//  Created by jason on 2016/10/9.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYScoreLiveWarnningViewController.h"
#import "SYSettingItem.h"
#import "SYSettingGroup.h"
#import "SYSettingSwitchItem.h"
#import "SYSettingLabelItem.h"

@interface SYScoreLiveWarnningViewController ()

@end

@implementation SYScoreLiveWarnningViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 第一组
    SYSettingItem *item1 = [SYSettingSwitchItem itemWithIcon:nil title:@"提醒我关注的比赛"];
    SYSettingGroup *group1 = [[SYSettingGroup alloc] init];
    group1.footerTitle = @"提醒";
    group1.items = @[item1];
    [self.cellData addObject:group1];
    // 第二组
    SYSettingItem *item2 = [SYSettingLabelItem itemWithIcon:nil title:@"起始时间"];
    SYSettingGroup *group2 = [[SYSettingGroup alloc] init];
    group2.headerTitle = @"起始时间";
    group2.items = @[item2];
    [self.cellData addObject:group2];
    // 第三组
    SYSettingItem *item3 = [SYSettingLabelItem itemWithIcon:nil title:@"结束时间"];
    SYSettingGroup *group3 = [[SYSettingGroup alloc] init];
    group3.items = @[item3];
    [self.cellData addObject:group3];
}

@end

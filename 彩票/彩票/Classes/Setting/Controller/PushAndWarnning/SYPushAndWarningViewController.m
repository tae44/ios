//
//  SYPushAndWarningViewController.m
//  彩票
//
//  Created by jason on 2016/10/9.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYPushAndWarningViewController.h"
#import "SYSettingItem.h"
#import "SYSettingArrowItem.h"
#import "SYSettingSwitchItem.h"
#import "SYSettingGroup.h"
#import "SYAwardNumPushViewController.h"
#import "SYAwardAnimationViewController.h"
#import "SYScoreLiveWarnningViewController.h"

@implementation SYPushAndWarningViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始化数据
    // 第一组
    SYSettingItem *item1 = [SYSettingArrowItem itemWithIcon:nil title:@"开奖号码推送" vcClass:[SYAwardNumPushViewController class]];
    SYSettingItem *item2 = [SYSettingArrowItem itemWithIcon:nil title:@"中奖动画" vcClass:[SYAwardAnimationViewController class]];
    SYSettingItem *item3 = [SYSettingArrowItem itemWithIcon:nil title:@"比分直播提醒" vcClass:[SYScoreLiveWarnningViewController class]];
    SYSettingItem *item4 = [SYSettingArrowItem itemWithIcon:nil title:@"购彩定时提醒"];
    // 创建组模型
    SYSettingGroup *group = [[SYSettingGroup alloc] init];
    group.items = @[item1, item2, item3, item4];
    [self.cellData addObject:group];
}

@end

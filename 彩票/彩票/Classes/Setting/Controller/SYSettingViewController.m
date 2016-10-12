//
//  SYSettingViewController.m
//  彩票
//
//  Created by jason on 2016/10/9.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYSettingViewController.h"
#import "SYSettingItem.h"
#import "SYSettingGroup.h"
#import "SYSettingArrowItem.h"
#import "SYSettingSwitchItem.h"
#import "SYSettingCell.h"
#import "ViewController.h"
#import "SYPushAndWarningViewController.h"
#import "SYHelpViewController.h"
#import "SYProductsShareViewController.h"
#import "SYShareViewController.h"
#import "SYAboutViewController.h"

@implementation SYSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    // 初始化数据
    // 第一组
    SYSettingItem *item1 = [SYSettingArrowItem itemWithIcon:@"MorePush" title:@"推送和提醒" vcClass:[SYPushAndWarningViewController class]];
    SYSettingItem *item2 = [SYSettingSwitchItem itemWithIcon:@"handShake" title:@"摇一摇机选"];
    SYSettingItem *item3 = [SYSettingSwitchItem itemWithIcon:@"sound_Effect" title:@"声音和效果"];
    // NSArray *group1 = @[item1, item2, item3];
    // 创建组模型
    SYSettingGroup *group1 = [[SYSettingGroup alloc] init];
    group1.items = @[item1, item2, item3];
//    group1.headerTitle = @"11111";
//    group1.footerTitle = @"ooooo";
    [self.cellData addObject:group1];
    // 第二组
    SYSettingItem *item4 = [SYSettingArrowItem itemWithIcon:@"MoreUpdate" title:@"检查版本更新"];
    // 版本更新是一个特殊的操作,把这个操作存在Block中
    item4.operation = ^() {
        // 获取本地版本号
        NSDictionary *info = [[NSBundle mainBundle] infoDictionary];
        NSString *localVersion = info[@"CFBundleShortVersionString"];
        NSLog(@"本地版本号为: %@", localVersion);
    };
    SYSettingItem *item5 = [SYSettingArrowItem itemWithIcon:@"MoreHelp" title:@"帮助" vcClass:[SYHelpViewController class]];
    SYSettingItem *item6 = [SYSettingArrowItem itemWithIcon:@"MoreShare" title:@"分享" vcClass:[SYShareViewController class]];
    SYSettingItem *item7 = [SYSettingArrowItem itemWithIcon:@"MoreMessage" title:@"查看消息"];
    SYSettingItem *item8 = [SYSettingArrowItem itemWithIcon:@"MoreNetease" title:@"产品推荐" vcClass:[SYProductsShareViewController class]];
    SYSettingItem *item9 = [SYSettingArrowItem itemWithIcon:@"IDInfo" title:@"关于" vcClass:[SYAboutViewController class]];
    // NSArray *group2 = @[item4, item5, item6, item7, item8, item9];
    SYSettingGroup *group2 = [[SYSettingGroup alloc] init];
    group2.items = @[item4, item5, item6, item7, item8, item9];
//    group2.headerTitle = @"22222";
//    group2.footerTitle = @"xxxxx";
    [self.cellData addObject:group2];
}

@end

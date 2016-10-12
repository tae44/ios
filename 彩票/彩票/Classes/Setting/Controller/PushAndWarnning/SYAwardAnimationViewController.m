//
//  SYAwardAnimationViewController.m
//  彩票
//
//  Created by jason on 2016/10/9.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYAwardAnimationViewController.h"
#import "SYSettingItem.h"
#import "SYSettingSwitchItem.h"
#import "SYSettingGroup.h"

@implementation SYAwardAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SYSettingItem *item = [SYSettingSwitchItem itemWithIcon:nil title:@"中奖动画"];
    SYSettingGroup *group = [[SYSettingGroup alloc] init];
    group.items = @[item];
    group.headerTitle = @"中奖动画";
    [self.cellData addObject:group];
}

@end

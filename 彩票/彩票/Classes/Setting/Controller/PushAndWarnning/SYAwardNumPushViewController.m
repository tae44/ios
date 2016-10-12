//
//  SYAwardNumPushViewController.m
//  彩票
//
//  Created by jason on 2016/10/9.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYAwardNumPushViewController.h"
#import "SYSettingItem.h"
#import "SYSettingSwitchItem.h"
#import "SYSettingGroup.h"

@implementation SYAwardNumPushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SYSettingItem *item1 = [SYSettingSwitchItem itemWithIcon:nil title:@"双色球"];
    SYSettingItem *item2= [SYSettingSwitchItem itemWithIcon:nil title:@"大乐透"];
    SYSettingGroup *group = [[SYSettingGroup alloc] init];
    group.items = @[item1, item2];
    group.headerTitle = @"推送";
    [self.cellData addObject:group];
}

@end

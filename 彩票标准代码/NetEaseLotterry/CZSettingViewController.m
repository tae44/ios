//
//  CZSettingViewController.m
//  NetEaseLotterry
//
//  Created by Vincent_Guo on 14-9-2.
//  Copyright (c) 2014年 vgios. All rights reserved.
//



#import "CZSettingViewController.h"
#import "CZPushViewController.h"
#import "CZSettingCell.h"
#import "CZProductsViewController.h"
#import "CZHelpViewController.h"
#import "CZShareViewController.h"
#import "CZAboutViewController.h"



@implementation CZSettingViewController

-(void)setupGroup1{
    //第一组
    CZSettingArrowItem *push = [CZSettingArrowItem settingItemWithIcon:@"MorePush" title:@"推送和提醒" vcClass:[CZPushViewController class]];
    
    CZSettingSwitchItem *shake = [CZSettingSwitchItem settingItemWithIcon:@"handShake" title:@"摇一摇机选" vcClass:nil];
    CZSettingSwitchItem *sound = [CZSettingSwitchItem settingItemWithIcon:@"MoreShare" title:@"声音和效果" vcClass:nil];
    
    CZSettingGroup *group1 = [[CZSettingGroup alloc] init];
    group1.items = @[push,shake,sound];
    
    [self.data addObject:group1];
}

-(void)setupGroup2{
    
    //第二组
    CZSettingArrowItem *version = [CZSettingArrowItem settingItemWithIcon:@"MoreUpdate" title:@"检查版本更新" vcClass:nil];
    version.option = ^{
        NSLog(@"检查新版本");
        [MBProgressHUD showMessage:@"正在检查更新"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [MBProgressHUD hideHUD];
            [MBProgressHUD showSuccess:@"已经是最新版本"];
        });
    };
    CZSettingArrowItem *help = [CZSettingArrowItem settingItemWithIcon:@"MoreHelp" title:@"帮助" vcClass:[CZHelpViewController class]];
    
    CZSettingArrowItem *share = [CZSettingArrowItem settingItemWithIcon:@"MoreShare" title:@"分享" vcClass:[CZShareViewController class]];
    
    CZSettingArrowItem *findMsg = [CZSettingArrowItem settingItemWithIcon:@"MoreMessage" title:@"查看消息" vcClass:nil];
    
    CZSettingArrowItem *productsRecommend = [CZSettingArrowItem settingItemWithIcon:@"MoreNetease" title:@"产品推荐" vcClass:[CZProductsViewController class]];
    
    CZSettingArrowItem *about = [CZSettingArrowItem settingItemWithIcon:@"MoreAbout" title:@"关于" vcClass:[CZAboutViewController class]];
    
    CZSettingGroup *group2 = [[CZSettingGroup alloc] init];
    group2.items = @[version,help,share,findMsg,productsRecommend,about];
    
    [self.data addObject:group2];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"设置";
    [self setupGroup1];
    [self setupGroup2];
    //CZLog(@"%@",self.data);
}




@end

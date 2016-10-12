//
//  SYAboutViewController.m
//  彩票
//
//  Created by jason on 2016/10/11.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYAboutViewController.h"
#import "SYSettingItem.h"
#import "SYSettingArrowItem.h"
#import "SYSettingGroup.h"

@interface SYAboutViewController ()

@end

@implementation SYAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SYSettingItem *item1 = [SYSettingArrowItem itemWithIcon:nil title:@"评分支持"];
    item1.operation = ^{
        // 跳到appstore 对应的应用的界面
        /* 评分
         》使用UIApplication打开URL 如 "itms-apps://itunes.apple.com/cn/app/%@?mt=8"
         》注意把id替换成appid //eg.725296055
         // appid 与bundleId是不同，每一个应用上传到appstore之后，就会有一个ID,这个ID是纯数字
         》什么是appID,每个应用上架后就有个application ID
         */
        // itms-apps://itunes.apple.com/cn/app/725296055?mt=8
        NSString *url = [NSString stringWithFormat:@"itms-apps://itunes.apple.com/cn/app/%@?mt=8",@"725296055"];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
    };
    SYSettingItem *item2= [SYSettingArrowItem itemWithIcon:nil title:@"客户电话" ];
    item2.subTitle = @"10086";
    item2.operation = ^{
        //打电话
        NSURL *url = [NSURL URLWithString:@"tel://10010"];
        [[UIApplication sharedApplication] openURL:url];
    };
    SYSettingGroup *group = [[SYSettingGroup alloc] init];
    group.items = @[item1,item2];
    [self.cellData addObject:group];
}

@end

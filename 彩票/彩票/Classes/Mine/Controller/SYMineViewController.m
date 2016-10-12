//
//  SYMineViewController.m
//  彩票
//
//  Created by jason on 2016/10/9.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYMineViewController.h"
#import "SYSettingViewController.h"

@interface SYMineViewController ()

@end

@implementation SYMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

/**
 点击设置按钮跳转
 */
- (IBAction)settingBtnClick {
    SYSettingViewController *settingVc = [[SYSettingViewController alloc] init];
    [self.navigationController pushViewController:settingVc animated:YES];
}

@end

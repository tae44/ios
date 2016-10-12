//
//  CZMineViewController.m
//  NetEaseLotterry
//
//  Created by Vincent_Guo on 14-9-2.
//  Copyright (c) 2014年 vgios. All rights reserved.
//

#import "CZMineViewController.h"
#import "UIImage+CZ.h"
#import "CZSettingViewController.h"

@interface CZMineViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation CZMineViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //设置按钮图片
    [self.loginBtn setBackgroundImage:[UIImage resizeImage:@"RedButton"] forState:UIControlStateNormal];
    [self.loginBtn setBackgroundImage:[UIImage resizeImage:@"RedButtonPressed"] forState:UIControlStateHighlighted];
    
}



- (IBAction)toSettingVc:(id)sender {
    CZSettingViewController *settingVc = [[CZSettingViewController alloc] init];
    
    [self.navigationController pushViewController:settingVc animated:YES];
    
}


@end

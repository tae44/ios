//
//  ThreeViewController.m
//  03.导航控制器(代码)
//
//  Created by Apple on 14/12/27.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "ThreeViewController.h"

@interface ThreeViewController ()

- (IBAction)backOneVc;

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [[UIButton alloc] init];
    btn.bounds = CGRectMake(0, 0, 46, 31);
    [btn setBackgroundImage:[UIImage imageNamed:@"btn_back_normal"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    //设置左边的按钮
    self.navigationItem.leftBarButtonItem = item;
}

- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)backOneVc {
    //返回第一个控制器(也就根控制器);
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end

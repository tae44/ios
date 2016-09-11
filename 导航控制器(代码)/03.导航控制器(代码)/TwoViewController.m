//
//  TwoViewController.m
//  03.导航控制器(代码)
//
//  Created by Apple on 14/12/27.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "TwoViewController.h"
#import "ThreeViewController.h"

@interface TwoViewController ()

- (IBAction)backVc;

- (IBAction)enterThreeVc;

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //希望下一个控制器的返回按钮是一张图片
    //通过下面的方法没法设置
    //UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_back_normal"] style:UIBarButtonItemStylePlain target:nil action:nil];
    
//    自定义按钮设置在返回按钮是无效
//    UIButton *btn = [[UIButton alloc] init];
//    btn.bounds = CGRectMake(0, 0, 46, 31);
//    [btn setBackgroundImage:[UIImage imageNamed:@"btn_back_normal"] forState:UIControlStateNormal];
//    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
//    self.navigationItem.backBarButtonItem = item;
}

- (void)dealloc{
    NSLog(@"%s",__func__);
}

- (IBAction)backVc {
    //返回上一个控制器
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)enterThreeVc {
    //进入第三个控制器
    ThreeViewController *threeVc = [[ThreeViewController alloc] init];
    [self.navigationController pushViewController:threeVc animated:YES];
}

@end

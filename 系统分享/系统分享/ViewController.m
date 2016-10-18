//
//  ViewController.m
//  系统分享
//
//  Created by jason on 2016/10/18.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"
#import <Social/Social.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 判断平台是否可用
    if (![SLComposeViewController isAvailableForServiceType:SLServiceTypeSinaWeibo]) {
        NSLog(@"查看您是否设置了新浪微博帐号,设置界面-->新浪微博-->配置帐号");
    }
    // 创建SLComposeViewController
    SLComposeViewController *composeVc = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeSinaWeibo];
    // 添加分享文字
    [composeVc setInitialText:@"哈哈"];
    // 添加分享图片
    // composeVc addImage:[UIImage imageNamed:@""];
    // 弹出分享界面
    [self presentViewController:composeVc animated:YES completion:nil];
    // 设置block属性
    composeVc.completionHandler = ^ (SLComposeViewControllerResult result) {
        if (result == SLComposeViewControllerResultCancelled) {
            NSLog(@"用户点击了取消");
        } else {
            NSLog(@"用户点击了发送");
        }
    };
}

@end

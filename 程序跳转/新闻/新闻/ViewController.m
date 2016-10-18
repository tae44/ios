//
//  ViewController.m
//  新闻
//
//  Created by jason on 2016/10/18.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
}

/**
 点击之后跳转到微信
 */
- (IBAction)jump {
    [self openWeiXin:@"weixin://"];
}

/**
 点击微信好友按钮跳转到微信好友
 */
- (IBAction)session {
    [self openWeiXin:@"weixin://session?news"];
}

/**
 点击朋友圈按钮跳转到微信朋友圈
 */
- (IBAction)timeline {
    [self openWeiXin:@"weixin://timeline"];
}

- (void)openWeiXin:(NSString *)urlStr {
    NSURL *weixinURL = [NSURL URLWithString:urlStr];
    if ([[UIApplication sharedApplication] canOpenURL:urlStr]) {
        [[UIApplication sharedApplication] openURL:urlStr options:nil completionHandler:nil];
    }
}

@end

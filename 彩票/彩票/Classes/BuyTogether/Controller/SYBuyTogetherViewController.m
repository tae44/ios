//
//  SYBuyTogetherViewController.m
//  彩票
//
//  Created by jason on 2016/10/9.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYBuyTogetherViewController.h"

@interface SYBuyTogetherViewController ()

@end

@implementation SYBuyTogetherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

/**
 点击导航条按钮时箭头旋转
 */
- (IBAction)btnClick:(UIButton *)sender {
    [UIView animateWithDuration:0.25 animations:^{
        if (CGAffineTransformIsIdentity(sender.imageView.transform)) {// 开始旋转
            sender.imageView.transform = CGAffineTransformMakeRotation(M_PI);
        } else {// 复原
            sender.imageView.transform = CGAffineTransformIdentity;
        }
    }];
}

@end

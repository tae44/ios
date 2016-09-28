//
//  ViewController.m
//  图片抖动
//
//  Created by jason on 2016/9/28.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

/**
 点击开始按钮
 */
- (IBAction)beginShake {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"transform.rotation";
    // 计算旋转的弧度
    CGFloat angle = M_PI_4;
    // 设置旋转的路径
    animation.values = @[@(-angle), @(angle), @(-angle)];
    // 设置动画的执行次数
    animation.repeatCount = MAXFLOAT;
    [self.imageView.layer addAnimation:animation forKey:@"shake"];
}

/**
 点击结束按钮
 */
- (IBAction)stopShake {
    // 通过key把动画移除,也就是把动画停止
    [self.imageView.layer removeAnimationForKey:@"shake"];
}

@end

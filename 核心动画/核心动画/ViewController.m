//
//  ViewController.m
//  核心动画
//
//  Created by jason on 2016/9/27.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <CAAnimationDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 想要在根层执行动画,使用核心动画
#warning 核心动画只是一个假象,真实的大小是没有变化的
    /*
     *解决方案1:如果想控件的大小真实改变,要在动画结束之后设置控件的尺寸
     *解决方案2:使动画保存执行之后的状态,默认动画执行完后,会返回原来的状态
     */
    
    // 创建一个动画对象
    CABasicAnimation *animation = [CABasicAnimation animation];
    // 设置图层的属性来决定动画类型
    // bounds 图层的尺寸动画
    animation.keyPath = @"bounds";
    // 设置bounds尺寸变化后的大小
    animation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 150, 150)];
    
    // 解决方案1:动画的代理
    // animation.delegate = self;
    
    // 解决方案2:使动画保存执行之后的状态,只要设置动画的两个属性
    // 动画对象不要移除
    animation.removedOnCompletion = NO;
    // 保持当前的状态
    animation.fillMode = kCAFillModeForwards;
    
    // 往控件的图层添加动画
    [self.imageView.layer addAnimation:animation forKey:nil];
}

#pragma mark CAAnimation的代理方法

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    self.imageView.bounds = CGRectMake(0, 0, 150, 150);
}

@end

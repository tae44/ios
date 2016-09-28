//
//  ViewController.m
//  CAKeyframeAnimation
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

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self animationWithCircle];
}

/**
 圆形动画
 */
- (void)animationWithCircle {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 5;
    // 设置路径 内部的path的优级大于values优先级
    CGMutablePathRef path = CGPathCreateMutable();
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGPathAddEllipseInRect(path, NULL, CGRectMake(0, 0, screenW, screenW));
    animation.path = path;
    //c语言的数据类型 如果create/copy/retain创建要释放
    CFRelease(path);
    [self.imageView.layer addAnimation:animation forKey:nil];
}

/**
 直线动画
 */
- (void)animationWithLine {
    // 创建一个帧动画
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position";
    // 设置动画执行的路径
    NSValue *p1 = [NSValue valueWithCGPoint:CGPointMake(50, 50)];
    NSValue *p2 = [NSValue valueWithCGPoint:CGPointMake(250, 50)];
    NSValue *p3 = [NSValue valueWithCGPoint:CGPointMake(250, 250)];
    NSValue *p4 = [NSValue valueWithCGPoint:CGPointMake(50, 250)];
    // 数组第一个是开始状态,最后一个是结束状态
    animation.values = @[p1, p2, p3, p4, p1];
    //设置动画节奏
    //kCAMediaTimingFunctionEaseIn 先慢后快
    //kCAMediaTimingFunctionEaseOut 先快后慢
    //kCAMediaTimingFunctionLinear 线性匀速
    //kCAMediaTimingFunctionEaseInEaseOut 中间快两边慢
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animation.duration = 3;
    [self.imageView.layer addAnimation:animation forKey:nil];
}

@end

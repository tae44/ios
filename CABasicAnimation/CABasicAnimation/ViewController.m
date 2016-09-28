//
//  ViewController.m
//  CABasicAnimation
//
//  Created by jason on 2016/9/28.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"

//动画执行的时间(秒)
#define DURATION 2

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self testTransformScaleAnimation];
}

/**
 测试缩放的动画
 */
- (void)testTransformScaleAnimation {
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.scale.x";
    animation.byValue = @1.5;
    animation.duration = DURATION;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [self.imageView.layer addAnimation:animation forKey:nil];
}

/**
 测试旋转的动画
 */
- (void)testTransformRotationAnimation {
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation.x";
    animation.byValue = @(M_PI_4);
    animation.duration = DURATION;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [self.imageView.layer addAnimation:animation forKey:nil];
}

/**
 测试平移的动画
 */
- (void)testTransformTranslationAnimation {
    CABasicAnimation *animation = [CABasicAnimation animation];
    // animation.keyPath = @"transform.translation";
    animation.keyPath = @"transform.translation.x";
    // animation.byValue = [NSValue valueWithCGPoint:CGPointMake(10, 10)];
    animation.byValue = @20;
    animation.duration = DURATION;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [self.imageView.layer addAnimation:animation forKey:nil];
}

/**
 测试位置的动画
 */
- (void)testPositionAnimation {
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position";
    // 动画初始状态
    // animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(150, 100)];
    // 动画最终状态
    // animation.toValue = [NSValue valueWithCGPoint:CGPointMake(100, 250)];
    // 每次动画的增加值
    animation.byValue = [NSValue valueWithCGPoint:CGPointMake(10, 10)];
    animation.duration = DURATION;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [self.imageView.layer addAnimation:animation forKey:nil];
}

/**
 测试尺寸的动画
 */
- (void)testBoundsAnimation {
    // 创建动画对象
    CABasicAnimation *animation = [CABasicAnimation animation];
    // bounds 图层的尺寸动画
    animation.keyPath = @"bounds";
    // 设置尺寸变化后的大小
    animation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 150, 150)];
    // 设置动画时间
    animation.duration = DURATION;
    // 动画对象不要移除
    animation.removedOnCompletion = NO;
    // 保持当前状态
    animation.fillMode = kCAFillModeForwards;
    // 往控件的图层添加动画
    [self.imageView.layer addAnimation:animation forKey:nil];
}

@end

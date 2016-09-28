//
//  ViewController.m
//  CAAnimationGroup
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
    // 有一张图片,同时可以有平移、旋转、缩放的效果
    // 实现这个效果,使用组动画CAAnimationGroup
    // 创建组动画
    CAAnimationGroup *group = [CAAnimationGroup animation];
    // 平移动画
    CABasicAnimation *positionAni = [CABasicAnimation animation];
    positionAni.keyPath = @"position";
    positionAni.toValue = [NSValue valueWithCGPoint:CGPointMake(250, 250)];
    // 旋转动画
    CABasicAnimation *rotationAni = [CABasicAnimation animation];
    rotationAni.keyPath = @"transform.rotation";
    rotationAni.toValue = @(M_PI_2);
    // 缩放动画
    CABasicAnimation *scaleAni = [CABasicAnimation animation];
    scaleAni.keyPath = @"transform.scale";
    scaleAni.toValue = @(1.5);
    // 将动画添加到组中
    group.duration = 3;
    group.animations = @[positionAni, rotationAni, scaleAni];
    // 把组动画添加到图层上
    [self.imageView.layer addAnimation:group forKey:nil];
}

@end

//
//  ViewController.m
//  车小弟模仿(动画)
//
//  Created by jason on 2016/9/28.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
/**黑色原盘背景*/
@property (weak, nonatomic) IBOutlet UIImageView *circleImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 往图片添加三个扇形按钮
    for (NSInteger i = 0; i < 3; i++) {
        NSString *imageName = [NSString stringWithFormat:@"circle%ld", i+1];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = self.circleImageView.bounds;
        [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        btn.tag = i;
        [self.circleImageView addSubview:btn];
    }
    // 添加中心按钮
    UIButton *centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    centerBtn.bounds = CGRectMake(0, 0, 112, 112);
    [centerBtn setBackgroundImage:[UIImage imageNamed:@"home_btn_dealer_had_bind"] forState:UIControlStateNormal];
    centerBtn.center = self.circleImageView.center;
    [centerBtn addTarget:self action:@selector(centerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    // 中心按钮不跟随圆盘进行动画,因此添加到self.view上
    [self.view addSubview:centerBtn];
}

/**
 点击中心按钮事件
 */
- (void)centerBtnClick:(UIButton *)sender {
    // 查看当前的透明度
    CGFloat currentAlpha = self.circleImageView.alpha;
    // 实现隐藏和显示
    if (currentAlpha) {
        self.circleImageView.alpha = 0;
    } else {
        self.circleImageView.alpha = 1;
    }
    // 创建组动画
    CAAnimationGroup *group = [CAAnimationGroup animation];
    // 创建透明度动画
    CABasicAnimation *opacityAni = [CABasicAnimation animation];
    opacityAni.keyPath = @"opacity";
    // 创建缩放动画
    CAKeyframeAnimation *scaleAni = [CAKeyframeAnimation animation];
    scaleAni.keyPath = @"transform.scale";
    // 创建旋转动画
    CABasicAnimation *rotationAni = [CABasicAnimation animation];
    rotationAni.keyPath = @"transform.rotation";
    // 将圆盘隐藏或显示时添加动画
    if (currentAlpha) { // 隐藏
        opacityAni.fromValue = @1;
        opacityAni.toValue = @0;
        scaleAni.values = @[@1, @1.2, @0];
        rotationAni.fromValue = @0;
        rotationAni.toValue = @(-M_PI_4);
    } else { // 显示
        opacityAni.fromValue = @0;
        opacityAni.toValue = @1;
        scaleAni.values = @[@0, @1.2, @1];
        rotationAni.fromValue = @(-M_PI_4);
        rotationAni.toValue = @0;
    }
    group.animations = @[opacityAni, scaleAni, rotationAni];
    group.duration = 1.5;
    [self.circleImageView.layer addAnimation:group forKey:nil];
}

@end

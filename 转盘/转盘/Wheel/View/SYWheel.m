//
//  SYWheel.m
//  转盘
//
//  Created by jason on 2016/10/11.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYWheel.h"
#import "SYWheelButton.h"

@interface SYWheel () <CAAnimationDelegate>
/**转盘图片*/
@property (nonatomic, weak) UIImageView *wheelImg;
/**选中的按钮*/
@property (nonatomic, strong) UIButton *selectedBtn;
/**中心的按钮*/
@property (nonatomic, weak) UIButton *centerBtn;
/**定时器*/
@property (nonatomic, strong) CADisplayLink *link;

@end

@implementation SYWheel

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 创建大背景图片
        UIImageView *backgroundImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LuckyBaseBackground"]];
        backgroundImg.center = self.center;
        [self addSubview:backgroundImg];
        // 创建转盘图片
        UIImageView *wheelImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LuckyRotateWheel"]];
        wheelImg.center = self.center;
        wheelImg.userInteractionEnabled = YES;
        self.wheelImg = wheelImg;
        [self addSubview:wheelImg];
        // 添加12个按钮
        // 按钮旋转的角度
        CGFloat angle = M_PI / 6;
        // 获取按钮正常状态的大图片
        UIImage *normalBigImg = [UIImage imageNamed:@"LuckyAstrology"];
        // 获取按钮选中状态的大图片
        UIImage *selBigImg = [UIImage imageNamed:@"LuckyAstrologyPressed"];
        // 获取屏幕比例
        CGFloat scale = [UIScreen mainScreen].scale;
        // 设置每个小图片的宽度和高度
        CGFloat imgW = normalBigImg.size.width / 12 * scale;
        CGFloat imgH = normalBigImg.size.height * scale;
        for (NSInteger i = 0; i < 12; i++) {
            // 创建按钮
            SYWheelButton *btn = [SYWheelButton buttonWithType:UIButtonTypeCustom];
            // 设置大小
            btn.bounds = CGRectMake(0, 0, 68, 143);
            // 随机设置背景颜色,方便看效果
            // btn.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255) / 255.0 green:arc4random_uniform(255) / 255.0 blue:arc4random_uniform(255) / 255.0 alpha:1];
            btn.layer.anchorPoint = CGPointMake(0.5, 1);
            btn.layer.position = CGPointMake(143, 143);
            // 旋转
            btn.transform = CGAffineTransformMakeRotation(angle * i);
            // 对应图片的区域
            CGRect imgRect = CGRectMake(imgW * i, 0, imgW, imgH);
            // 剪切LuckyAstrology对应的图片
            CGImageRef normalImgRef = CGImageCreateWithImageInRect(normalBigImg.CGImage, imgRect);
            // 设置正常状态的图片
            [btn setImage:[UIImage imageWithCGImage:normalImgRef] forState:UIControlStateNormal];
            // 设置选中状态的图片
            CGImageRef selImgRef = CGImageCreateWithImageInRect(selBigImg.CGImage, imgRect);
            [btn setImage:[UIImage imageWithCGImage:selImgRef] forState:UIControlStateSelected];
            [btn setBackgroundImage:[UIImage imageNamed:@"LuckyRototeSelected"] forState:UIControlStateSelected];
            // 监听事件
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
            // 默认第一个按钮被选中
            if (i == 0) {
                [self btnClick:btn];
            }
            [wheelImg addSubview:btn];
        }
        // 添加中间的按钮
        UIButton *centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        centerBtn.bounds = CGRectMake(0, 0, 90, 90);
        centerBtn.center = self.center;
        [centerBtn setImage:[UIImage imageNamed:@"LuckyCenterButton"] forState:UIControlStateNormal];
        [centerBtn setImage:[UIImage imageNamed:@"LuckyCenterButtonPressed"] forState:UIControlStateHighlighted];
        [centerBtn addTarget:self action:@selector(centerBtnClick) forControlEvents:UIControlEventTouchUpInside];
        self.centerBtn = centerBtn;
        [self addSubview:centerBtn];
    }
    return self;
}

- (void)btnClick:(UIButton *)btn {
    self.selectedBtn.selected = NO;
    btn.selected = YES;
    self.selectedBtn = btn;
}

/**
 点击中心按钮
 */
- (void)centerBtnClick {
    // 去除之前的自动旋转
    [self stop];
    // 快速旋转,其它按钮不给点
    self.wheelImg.userInteractionEnabled = NO;
    self.centerBtn.userInteractionEnabled = NO;
    CABasicAnimation *rotationAni = [CABasicAnimation animation];
    rotationAni.keyPath = @"transform.rotation";
    rotationAni.toValue = @(M_PI * 6);
    rotationAni.duration = 2;
    // 设置代理
    rotationAni.delegate = self;
    [self.wheelImg.layer addAnimation:rotationAni forKey:nil];
}

/**
 停止自动旋转
 */
- (void)stop {
    // 禁用定时器
    [self.link invalidate];
    self.link = nil;
}

/**
 开始自动旋转
 */
- (void)start {
    if (!self.link) {
        self.link = [CADisplayLink displayLinkWithTarget:self selector:@selector(beginRotation)];
        [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    }
}

/**
 实现旋转
 */
- (void)beginRotation {
    CGFloat angle = M_PI_4 / 60;
    self.wheelImg.transform = CGAffineTransformRotate(self.wheelImg.transform, angle);
}

#pragma mark - 核心动画的代理方法

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    // 核心动画结束后,2秒后自动旋转
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 恢复按钮点击
        self.wheelImg.userInteractionEnabled = YES;
        self.centerBtn.userInteractionEnabled = YES;
        [self start];
    });
}

@end

//
//  ViewController.m
//  加速计(UIAccelerometer)
//
//  Created by jason on 2016/11/1.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"
#import "UIView+AdjustFrame.h"

@interface ViewController () <UIAccelerometerDelegate>
/**小球*/
@property (weak, nonatomic) IBOutlet UIImageView *ball;
/**保留当前的速度*/
@property (nonatomic, assign) CGPoint velocity;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 获取单例对象
    UIAccelerometer *accelermeter = [UIAccelerometer sharedAccelerometer];
    // 设置代理
    accelermeter.delegate = self;
    // 设置采样间隔
    accelermeter.updateInterval = 1 / 30.0;
}

/**
 采集到加速计数据的时候会调用该方法

 @param acceleration 包含了加速计在某一个时刻的数据
 */
- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
    // 默认是受到重力的加速度的影响
    NSLog(@"x:%f y:%f z:%f", acceleration.x, acceleration.y, acceleration.z);
    // 获取小球的速度(加速度累加)
    _velocity.x += acceleration.x;
    _velocity.y += acceleration.y;
    // 改变小球的位置
    self.ball.x += _velocity.x;
    self.ball.y -= _velocity.y;
    // 边界判断
    if (self.ball.x >= self.view.width - self.ball.width) {
        self.ball.x = self.view.width - self.ball.width;
        _velocity.x *= -0.7;
    }
    if (self.ball.x <= 0) {
        self.ball.x = 0;
        _velocity.x *= -0.7;
    }
    if (self.ball.y >= self.view.height - self.ball.height) {
        self.ball.y = self.view.height - self.ball.height;
        _velocity.y *= -0.7;
    }
    if (self.ball.y <= 0) {
        self.ball.y = 0;
        _velocity.y *= -0.7;
    }
}

@end

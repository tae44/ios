//
//  ViewController.m
//  加速计(CoreMotion)
//
//  Created by jason on 2016/11/1.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface ViewController ()

@property (nonatomic, strong) CMMotionManager *mgr;

@end

@implementation ViewController

- (CMMotionManager *)mgr {
    if (!_mgr) {
        _mgr = [[CMMotionManager alloc] init];
    }
    return _mgr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 陀螺仪是否可用
    if (!self.mgr.isGyroAvailable) return;
    // 开始采样
    [self.mgr startGyroUpdates];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // CMAcceleration acceleration = self.mgr.accelerometerData.acceleration;
    CMRotationRate rate = self.mgr.gyroData.rotationRate;
    NSLog(@"x:%f y:%f z:%f", rate.x, rate.y, rate.z);
}

#pragma mark - 获取陀螺仪信息

- (void)pushGyro {
    if (!self.mgr.isGyroAvailable) return;
    self.mgr.gyroUpdateInterval = 1.0;
    [self.mgr startGyroUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMGyroData * _Nullable gyroData, NSError * _Nullable error) {
        if (error) return;
        CMRotationRate rotationRate = gyroData.rotationRate;
        NSLog(@"x:%f y:%f z:%f", rotationRate.x, rotationRate.y, rotationRate.z);
    }];
}

#pragma mark - 获取加速计信息

- (void)pullAccelerometer {
    // 判断加速计是否可用
    if (!self.mgr.isAccelerometerAvailable) return;
    // 开始采样
    [self.mgr startAccelerometerUpdates];
}

- (void)pushAccelerometer {
    if (!self.mgr.isAccelerometerAvailable) return;
    self.mgr.accelerometerUpdateInterval = 1 / 30.0;
    [self.mgr startAccelerometerUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMAccelerometerData * _Nullable accelerometerData, NSError * _Nullable error) {
        // 获取加速计信息
        CMAcceleration acceleration = accelerometerData.acceleration;
        NSLog(@"x:%f y:%f z:%f", acceleration.x, acceleration.y, acceleration.z);
    }];
}

@end

//
//  ViewController.m
//  CoreLocation
//
//  Created by jason on 2016/10/13.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController () <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *mgr;

@end

@implementation ViewController

- (CLLocationManager *)mgr {
    if (!_mgr) {
        // 创建定位管理者
        _mgr = [[CLLocationManager alloc] init];
        // 设置代理
        _mgr.delegate = self;
        // 位置间隔之后重新定位
        _mgr.distanceFilter = 10;
        // 定位的精确度
        _mgr.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
        // 使用程序期间允许访问位置数据
        [_mgr requestWhenInUseAuthorization];
    }
    return _mgr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 开始定位
    [self.mgr startUpdatingLocation];
    // [self countDistance];
}

/**
 定位到用户的位置会调用该方法(并且该方法调用非常频繁)

 @param locations 存放定位的所有位置
 */
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    // 获取用户位置对象
    CLLocation *location = [locations lastObject];
    CLLocationCoordinate2D coordinate = location.coordinate;
    NSLog(@"纬度:%f 经度:%f", coordinate.latitude, coordinate.longitude);
    // 停止定位
    [self.mgr stopUpdatingLocation];
}

/**
 计算两个经纬度之间的距离
 */
- (void)countDistance {
    CLLocation *l1 = [[CLLocation alloc] initWithLatitude:23.22 longitude:113.33];
    CLLocation *l2 = [[CLLocation alloc] initWithLatitude:40.29 longitude:116.55];
    CLLocationDistance distance = [l1 distanceFromLocation:l2];
    NSLog(@"%f", distance);
}

@end

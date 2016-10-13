//
//  ViewController.m
//  地图基本使用
//
//  Created by jason on 2016/10/13.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController () <MKMapViewDelegate>

@property (nonatomic, weak) MKMapView *mapView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    // 创建MKMapView对象并添加到view
    MKMapView *mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, screenSize.width, screenSize.height)];
    [self.view addSubview:mapView];
    self.mapView = mapView;
    // 设置代理
    mapView.delegate = self;
    // 跟踪用户位置
    mapView.userTrackingMode = MKUserTrackingModeFollow;
    // 设置地图类型
    // mapView.mapType = MKMapTypeSatellite;
    // 是否显示用户位置
    //mapView.showsUserLocation = YES;
    //获取当前位置
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
    locationManager.distanceFilter = 100;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager requestWhenInUseAuthorization];
    [locationManager startUpdatingLocation];
    // 创建返回按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(30, 620, 59, 59);
    [btn setImage:[UIImage imageNamed:@"btn_map_locate"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"btn_map_locate_hl"] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(backToCenter) forControlEvents:UIControlEventTouchUpInside];
}

/**
 点击按钮回到中心
 */
- (void)backToCenter {
    // MKCoordinateSpan span = MKCoordinateSpanMake(0.002703, 0.001717);
    // MKCoordinateRegion region = MKCoordinateRegionMake(self.mapView.userLocation.location.coordinate, span);
    // [self.mapView setRegion:region animated:YES];
    [self.mapView setCenterCoordinate:self.mapView.userLocation.location.coordinate animated:YES];
}

/**
 定位到用户位置调用

 @param userLocation 大头针模型
 */
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    // 取出用户位置
    // CLLocationCoordinate2D coordinate = userLocation.location.coordinate;
    // 设置显示位置
    // [mapView setCenterCoordinate:coordinate animated:YES];
    // 设置显示区域
    // MKCoordinateSpan span = MKCoordinateSpanMake(0.002703, 0.001717);
    // MKCoordinateRegion region = MKCoordinateRegionMake(coordinate, span);
    // [mapView setRegion:region animated:YES];
    // 改变大头针显示的内容(通过改变大头针模型的属性)
    // userLocation.title = @"北京市";
    // userLocation.subtitle = @"北京市东城区";
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    CLLocation *location = userLocation.location;
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (placemarks.count == 0 || error) return;
        CLPlacemark *pm = [placemarks firstObject];
        if (pm.locality) {
            userLocation.title = pm.locality;
        } else {
            userLocation.title = pm.administrativeArea;
        }
        userLocation.subtitle = pm.name;
    }];
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    MKCoordinateRegion region = mapView.region;
    CLLocationCoordinate2D center = region.center;
    MKCoordinateSpan span = region.span;
    NSLog(@"纬度:%f 经度:%f", center.latitude, center.longitude);
    NSLog(@"纬度跨度:%f 经度跨度:%f", span.latitudeDelta, span.longitudeDelta);
}

@end

//
//  ViewController.m
//  地图画线
//
//  Created by jason on 2016/10/14.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>

@interface ViewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UITextField *destinationField;
@property (nonatomic, strong) CLLocationManager *mgr;

@end

@implementation ViewController

- (CLLocationManager *)mgr {
    if (!_mgr) {
        _mgr = [[CLLocationManager alloc] init];
    }
    return _mgr;
}

- (void)viewDidLoad {
    self.mapView.delegate = self;
    self.mapView.userTrackingMode = MKUserTrackingModeFollow;
    // 如果是iOS8以上,需要请求授权方式(进行判断,否则在iOS7会崩溃,需要先在info.plist中配置)
    // 通过判断系统版本来确定是否需要请求requestAlwaysAuthorization授权
    // if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
    //     [self.mgr requestAlwaysAuthorization];
    // }
    if ([self.mgr respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        [self.mgr requestAlwaysAuthorization];
    }
}

- (IBAction)drawLine {
    // 退出键盘
    [self.view endEditing:YES];
    // 获取目的地
    NSString *destination = self.destinationField.text;
    if (destination.length == 0) return;
    // 地理编码
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:destination completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (placemarks.count == 0 || error) return;
        // 获取CLPlaceMark对象
        CLPlacemark *clpm = [placemarks firstObject];
        // 利用CLPlacemark来创建MKPlacemark
        MKPlacemark *mkpm = [[MKPlacemark alloc] initWithPlacemark:clpm];
        // 创建目的地的MKMapItem对象
        MKMapItem *destinationItem = [[MKMapItem alloc] initWithPlacemark:mkpm];
        // 起点的MKMapItem
        MKMapItem *sourceItem = [MKMapItem mapItemForCurrentLocation];
        // 开始画线
        [self drawLineWithSourceItem:sourceItem destinationItem:destinationItem];
    }];
}

/**
 开始画线

 @param sourceItem      起点的Item
 @param destinationItem 终点的Item
 */
- (void)drawLineWithSourceItem:(MKMapItem *)sourceItem destinationItem:(MKMapItem *)destinationItem {
    // 创建MKDirectionsRequest对象
    MKDirectionsRequest *request = [[MKDirectionsRequest alloc] init];
    // 设置起点Item
    request.source = sourceItem;
    // 设置终点Item
    request.destination = destinationItem;
    // 创建MKDirections对象
    MKDirections *directions = [[MKDirections alloc] initWithRequest:request];
    // 请求/计算(当请求到路线信息的时候会来到该方法)
    [directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse * _Nullable response, NSError * _Nullable error) {
        // 当有错误,或者路线数量为0直接返回
        if (response == 0 || error) return;
        // 遍历所有路线
        for (MKRoute *route in response.routes) {
            // 取出路线(遵守MKOverlay)
            MKPolyline *polyline = route.polyline;
            // 将路线添加到地图上
            [self.mapView addOverlay:polyline];
        }
    }];
}

/**
 当一个遮盖添加到地图上时会执行该方法

 @param overlay 遵守MKOverlay的对象

 @return 画线的渲染
 */
- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    MKPolylineRenderer *poly = [[MKPolylineRenderer alloc] initWithOverlay:overlay];
    poly.strokeColor = [UIColor yellowColor];
    poly.lineWidth = 5;
    return poly;
}

@end

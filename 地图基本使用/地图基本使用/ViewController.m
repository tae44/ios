//
//  ViewController.m
//  地图基本使用
//
//  Created by jason on 2016/10/13.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
//#import <CoreLocation/CoreLocation.h>
#import "SYAnnotation.h"
#import "SYAnnotationView.h"

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
    // 添加增加大头针按钮
    UIButton *addBtn = [[UIButton alloc] initWithFrame:CGRectMake(300, 620, 80, 30)];
    [self.view addSubview:addBtn];
    [addBtn setTitle:@"添加大头针" forState:UIControlStateNormal];
    [addBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    addBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [addBtn addTarget:self action:@selector(addAnnotation) forControlEvents:UIControlEventTouchUpInside];
}

/**
 在地图上添加一个大头针就会执行该方法

 @param annotation 大头针模型对象

 @return 大头针的View(返回nil表示默认使用系统,默认MKAnnotationView是不可见)
 */
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    // 如果是用户位置的大头针,直接返回nil,使用系统的
    if ([annotation isKindOfClass:[MKUserLocation class]]) return nil;
    // 添加自己的大头针view
    SYAnnotationView *annoView = [SYAnnotationView SYAnnoViewWithMapView:mapView];
    return annoView;
}

- (void)addAnnotation {
    // 添加两个大头针
    SYAnnotation *anno1 = [[SYAnnotation alloc] init];
    anno1.coordinate = CLLocationCoordinate2DMake(40.06, 116.39);
    anno1.title = @"北京市";
    anno1.subtitle = @"中国北京市昌平区";
    anno1.icon = @"category_1";
    SYAnnotation *anno2 = [[SYAnnotation alloc] init];
    anno2.coordinate = CLLocationCoordinate2DMake(30.23, 120.23);
    anno2.title = @"杭州市";
    anno2.subtitle = @"浙江省杭州市萧山区";
    anno2.icon = @"category_2";
    [self.mapView addAnnotations:@[anno1, anno2]];
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
 大头针的View已经被添加mapView会执行该方法

 @param views   所有大头针的View都存放在该数组中
 */
- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray<MKAnnotationView *> *)views {
    for (MKAnnotationView *annoView in views) {
        // 如果是系统的大头针直接返回
        if ([annoView isKindOfClass:[MKUserLocation class]]) return;
        // 取出大头针view最终位置
        CGRect endFrame = annoView.frame;
        // 重新设置位置
        annoView.frame = CGRectMake(endFrame.origin.x, 0, endFrame.size.width, endFrame.size.height);
        // 执行动画
        [UIView animateWithDuration:0.5 animations:^{
            annoView.frame = endFrame;
        }];
    }
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

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    // 获取用户点击的点
//    CGPoint point = [[touches anyObject] locationInView:self.view];
//    // 将点转化为经纬度
//    CLLocationCoordinate2D coordinate = [self.mapView convertPoint:point toCoordinateFromView:self.view];
//    // 添加大头针
//    SYAnnotation *anno = [[SYAnnotation alloc] init];
//    anno.coordinate = coordinate;
//    anno.title = @"姜式餐饮";
//    anno.subtitle = @"姜式餐饮是中国最好的餐饮集团";
//    [self.mapView addAnnotation:anno];
//}

/**
 地图放大或缩小后调用
 */
//- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
//{
//    MKCoordinateRegion region = mapView.region;
//    CLLocationCoordinate2D center = region.center;
//    MKCoordinateSpan span = region.span;
//    NSLog(@"纬度:%f 经度:%f", center.latitude, center.longitude);
//    NSLog(@"纬度跨度:%f 经度跨度:%f", span.latitudeDelta, span.longitudeDelta);
//}

@end

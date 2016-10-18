//
//  ViewController.m
//  内嵌百度地图
//
//  Created by jason on 2016/10/17.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"
#import "BaiduMapAPI_Base/BMKBaseComponent.h"
#import "BaiduMapAPI_Map/BMKMapComponent.h"
#import "BaiduMapAPI_Search/BMKSearchComponent.h"

@interface ViewController () <BMKMapViewDelegate,BMKPoiSearchDelegate>
{
    BMKPoiSearch *_poiSearch;
}

@property (nonatomic, weak) BMKMapView *mapView;

@end

@implementation ViewController

- (void)loadView {
    BMKMapView *mapView = [[BMKMapView alloc] init];
    mapView.frame = [UIScreen mainScreen].bounds;
    self.view = mapView;
    self.mapView = mapView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBaseSetting];
    // 创建BMKPoiSearch对象
    _poiSearch = [[BMKPoiSearch alloc] init];
    _poiSearch.delegate = self;
    // 创建BMKNearbySearchOption操作
    BMKNearbySearchOption *option = [[BMKNearbySearchOption alloc] init];
    option.pageIndex = 0;
    option.pageCapacity = 10;
    option.location = CLLocationCoordinate2DMake(39.915, 116.404);
    option.keyword = @"酒店";
    // 调用BMKPoiSearch的poiSearchNearBy
    BOOL flag = [_poiSearch poiSearchNearBy:option];
    if(flag) {
        NSLog(@"周边检索发送成功");
    } else {
        NSLog(@"周边检索发送失败");
    }
}

/**
 当检索到结果的时候会调用

 @param poiResult 搜索结果在该对象中(poiInfoList数组中存放着搜索结果)
 @param errorCode 错误码(为0表示正常返回结果)
 */
- (void)onGetPoiResult:(BMKPoiSearch *)searcher result:(BMKPoiResult *)poiResult errorCode:(BMKSearchErrorCode)errorCode {
    // 先将之前的大头针移除
    [self.mapView removeAnnotations:self.mapView.annotations];
    // 如果没有错误,则将搜索结果转化成大头针添加到地图上
    if (errorCode == BMK_SEARCH_NO_ERROR) {
        // 遍历所有的结果(都是BMKPoiInfo对象)
        for (BMKPoiInfo *poiInfo in poiResult.poiInfoList) {
            // 将BMKPoiInfo对象的属性转化成大头针对应的属性
            BMKPointAnnotation *anno = [[BMKPointAnnotation alloc] init];
            anno.coordinate = poiInfo.pt;
            anno.title = poiInfo.name;
            anno.subtitle = poiInfo.address;
            [self.mapView addAnnotation:anno];
        }
    }
}

/**
 当有大头针添加到地图上时会执行该方法

 @param annotation 大头针模型对象

 @return 大头针的view
 */
- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id<BMKAnnotation>)annotation {
    if ([annotation isKindOfClass:[BMKPointAnnotation class]]) {
        BMKPinAnnotationView *newAnnotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"myAnnotation"];
        newAnnotationView.pinColor = BMKPinAnnotationColorGreen;
        newAnnotationView.animatesDrop = YES;// 设置该标注点动画显示
        return newAnnotationView;
    }
    return nil;
}

- (void)viewWillAppear:(BOOL)animated {
    [self.mapView viewWillAppear];
    self.mapView.delegate = self; // 此处记得不用的时候需要置nil,否则影响内存的释放
    // 添加一个PointAnnotation
    BMKPointAnnotation *annotation = [[BMKPointAnnotation alloc] init];
    CLLocationCoordinate2D coor;
    coor.latitude = 39.915;
    coor.longitude = 116.404;
    annotation.coordinate = coor;
    annotation.title = @"这里是北京";
    [self.mapView addAnnotation:annotation];
}

- (void)setupBaseSetting {
    // 设置地图类型
    // [self.mapView setMapType:BMKMapTypeSatellite];
    // 设置显示路况
    // [self.mapView setTrafficEnabled:YES];
    // 设置热力图
    // [self.mapView setBaiduHeatMapEnabled:YES];
    // 设置地图比例尺等级
    [self.mapView setZoomLevel:16.0];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.mapView viewWillDisappear];
    self.mapView.delegate = nil;
}

@end

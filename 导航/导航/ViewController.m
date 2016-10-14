//
//  ViewController.m
//  导航
//
//  Created by jason on 2016/10/14.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *destinationField;

@end

@implementation ViewController

- (IBAction)navigate {
    // 拿到用户输入的目的地
    NSString *destination = self.destinationField.text;
    if (destination.length == 0) return;
    // 地理编码
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:destination completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (placemarks.count == 0 || error) return;
        // 取出地理编码出的地标
        CLPlacemark *clpm = [placemarks firstObject];
        // 利用CLPlacemark来创建MKPlacemark
        MKPlacemark *mkpm = [[MKPlacemark alloc] initWithPlacemark:clpm];
        // 利用MKPlacemark来创建目的地的MKMapItem
        MKMapItem *destinationItem = [[MKMapItem alloc] initWithPlacemark:mkpm];
        // 获得起点
        MKMapItem *sourceItem = [MKMapItem mapItemForCurrentLocation];
        // 开始导航
        [self startNavigateWithSourceItem:sourceItem destinationItem:destinationItem];
    }];
}

/**
 开始导航

 @param sourceItem      起点的Item
 @param destinationItem 重点的Item
 */
- (void)startNavigateWithSourceItem:(MKMapItem *)sourceItem destinationItem:(MKMapItem *)destinationItem {
    // 将起点和终点放入数组
    NSArray *items = @[sourceItem, destinationItem];
    // 设置Options参数(字典)
    NSDictionary *options = @{
                MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving,
                MKLaunchOptionsMapTypeKey : @(MKMapTypeHybrid),
                MKLaunchOptionsShowsTrafficKey : @YES
    };
    // 开始导航
    [MKMapItem openMapsWithItems:items launchOptions:options];
}

@end

//
//  GeocodeViewController.m
//  Geocoder
//
//  Created by jason on 2016/10/13.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "GeocodeViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface GeocodeViewController ()

@property (weak, nonatomic) IBOutlet UITextField *addressField;
@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation GeocodeViewController

- (IBAction)geocode {
    // 取出用户输入的地址
    NSString *address = self.addressField.text;
    if (address.length == 0) return;
    // 地理编码
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:address completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        // 如果解析有错误,或者解析出的数组个数为0,直接返回
        if (placemarks.count == 0 || error) return;
        // 遍历所有的地标对象(如果是实际开发,可以给用户以列表的形式展示)
        for (CLPlacemark *pm in placemarks) {
            // 取出位置信息
            CLLocation *location = pm.location;
            // 取出经纬度
            CLLocationCoordinate2D coordinate = location.coordinate;
            // 将信息显示到界面
            self.latitudeLabel.text = [NSString stringWithFormat:@"%.2f", coordinate.latitude];
            self.longitudeLabel.text = [NSString stringWithFormat:@"%.2f", coordinate.longitude];
            self.resultLabel.text = pm.name;
        }
    }];
}

@end

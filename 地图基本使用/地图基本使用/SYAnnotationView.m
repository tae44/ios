//
//  SYAnnotationView.m
//  地图基本使用
//
//  Created by jason on 2016/10/14.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYAnnotationView.h"
#import "SYAnnotation.h"

@implementation SYAnnotationView

+ (instancetype)SYAnnoViewWithMapView:(MKMapView *)mapView {
    static NSString *ID = @"annoView";
    // 从缓冲池中取大头针的view
    SYAnnotationView *annoView = (SYAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:ID];
    // 如果为nil则创建
    if (!annoView) {
        annoView = [[SYAnnotationView alloc] initWithAnnotation:nil reuseIdentifier:ID];
        // 设置标题和子标题可以呼出
        annoView.canShowCallout = YES;
        // 在左右两侧放一个View
        annoView.leftCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeContactAdd];
        annoView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        // 自定义的下面两个属性无法使用
        // 设置大头针的颜色
        // annoView.pinTintColor = [UIColor blueColor];
        // 掉落效果
        // annoView.animatesDrop = YES;
    }
    return annoView;
}

- (void)setAnnotation:(SYAnnotation *)annotation {
    self.image = [UIImage imageNamed:annotation.icon];
    [super setAnnotation:annotation];
}

@end

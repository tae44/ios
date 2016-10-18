//
//  AppDelegate.h
//  内嵌百度地图
//
//  Created by jason on 2016/10/17.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BaiduMapAPI_Base/BMKBaseComponent.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    UINavigationController *navigationController;
    BMKMapManager* _mapManager;
}

@property (strong, nonatomic) UIWindow *window;

@end


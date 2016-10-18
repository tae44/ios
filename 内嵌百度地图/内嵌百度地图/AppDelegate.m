//
//  AppDelegate.m
//  内嵌百度地图
//
//  Created by jason on 2016/10/17.
//  Copyright © 2016年 jason. All rights reserved.
//
/*
 c : 项目的编译语言是C语言
 .m : 项目的编译语言:OC语言和C语言
 .mm : 项目的编译语言是:C++/OC/C
 .cpp : 项目的编译语言包含:C++
 */

#import "AppDelegate.h"

@interface AppDelegate () <BMKGeneralDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _mapManager = [[BMKMapManager alloc] init];
    // 如果要关注网络及授权验证事件，请设定generalDelegate参数
    BOOL ret = [_mapManager start:@"cxtCxByWQO1ftGLcRjO67swHICsH135T"  generalDelegate:self];
    if (!ret) {
        NSLog(@"manager start failed!");
    }
    return YES;
}

- (void)onGetNetworkState:(int)iError {
    if (iError) {
        NSLog(@"联网失败");
    } else {
        NSLog(@"联网成功");
    }
}

- (void)onGetPermissionState:(int)iError {
    if (iError) {
        NSLog(@"授权失败");
    } else {
        NSLog(@"授权成功");
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

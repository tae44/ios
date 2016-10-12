//
//  CZAppDelegate.m
//  NetEaseLotterry
//
//  Created by Vincent_Guo on 14-8-3.
//  Copyright (c) 2014年 vgios. All rights reserved.
//

#import "CZAppDelegate.h"

@implementation CZAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    //状态栏样式
    application.statusBarStyle = UIStatusBarStyleLightContent;
    application.statusBarHidden = NO;
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    //[infoDictionary objectForKey:@"CFBundleVersion"]
    NSLog(@"==%@",infoDictionary);
    return YES;
}

@end

//
//  AppDelegate.m
//  04-远程推送
//
//  Created by apple on 15/2/5.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    if ([UIDevice currentDevice].systemVersion.doubleValue >= 8.0) {
        // 1.请求授权可以给用户发送通知
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeSound | UIUserNotificationTypeBadge | UIUserNotificationTypeAlert categories:nil];
        [application registerUserNotificationSettings:settings];
        
        // 2.注册远程通知
        [application registerForRemoteNotifications];
    } else {
        [application registerForRemoteNotificationTypes:UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound];
    }
    
    if (launchOptions[UIApplicationLaunchOptionsRemoteNotificationKey]) {
        // 跳转
    }
    
    return YES;
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    // 25bb75ac 3ffcebd7 90d9f517 1ebca904 154a367a 87781e5d b9ea288e 37fdf487
    NSLog(@"%@", deviceToken.description);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    NSLog(@"%@", userInfo);
}

@end

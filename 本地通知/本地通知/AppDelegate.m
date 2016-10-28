//
//  AppDelegate.m
//  本地通知
//
//  Created by jason on 2016/10/25.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "AppDelegate.h"
#import <UserNotifications/UserNotifications.h>

@interface AppDelegate () <UNUserNotificationCenterDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 创建UNUserNotificationCenter来管理通知
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    // 监听回调事件
    center.delegate = self;
    // iOS 10 使用以下方法注册才能得到授权
    /*
     UNAuthorizationOptionBadge   = (1 << 0),
     UNAuthorizationOptionSound   = (1 << 1),
     UNAuthorizationOptionAlert   = (1 << 2),
     */
    [center requestAuthorizationWithOptions:(UNAuthorizationOptionAlert+UNAuthorizationOptionBadge+UNAuthorizationOptionSound) completionHandler:^(BOOL granted, NSError * _Nullable error) {
        
    }];
    // 获取当前的通知设置,UNNotificationSettings是只读对象,不能直接修改,只能通过以下方法获取
    [center getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
        
    }];
    return YES;
}

#pragma mark - UNUserNotificationCenterDelegate

//在展示通知前进行处理,即有机会在展示通知前再修改通知内容
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler {
    // 处理通知
    // 处理完成后条用completionHandler,用于指示在前台显示通知的形式
    completionHandler(UNNotificationPresentationOptionAlert);
    
}

@end

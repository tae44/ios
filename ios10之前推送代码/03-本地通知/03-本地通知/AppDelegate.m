//
//  AppDelegate.m
//  03-本地通知
//
//  Created by apple on 15/2/5.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    /*
     UIUserNotificationTypeNone    = 0,      没有,没有本地通知
     UIUserNotificationTypeBadge   = 1 << 0, 接受图标右上角提醒数字
     UIUserNotificationTypeSound   = 1 << 1, 接受通知时候,可以发出音效
     UIUserNotificationTypeAlert   = 1 << 2, 接受提醒(横幅/弹窗)
     */
    // iOS8需要添加请求用户的授权
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge | UIUserNotificationTypeAlert | UIUserNotificationTypeSound categories:nil];
        [application registerUserNotificationSettings:settings];
    }
    
    if (launchOptions[UIApplicationLaunchOptionsLocalNotificationKey]) {
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(0, 300, 300, 300);
        label.backgroundColor = [UIColor blueColor];
        label.text = [NSString stringWithFormat:@"%@", launchOptions];
        label.font = [UIFont systemFontOfSize:14.0];
        label.textColor = [UIColor whiteColor];
        label.numberOfLines = 0;
        [self.window.rootViewController.view addSubview:label];
    }
    
    return YES;
}

/**
 *  如果应用在后台,通过点击通知的时候打开应用会来到该代理方法
 *  如果应用在前台,接受到本地通知就会调用该方法
 *
 *  @param notification 通过哪一个通知来这里
 */
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
//    if (application.applicationState == UIApplicationStateActive) return;
//    if (application.applicationState == UIApplicationStateInactive) {
//        NSLog(@"跳转");
//    }
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 0, 300, 300);
    label.backgroundColor = [UIColor redColor];
    label.text = [NSString stringWithFormat:@"%@", notification];
    label.font = [UIFont systemFontOfSize:14.0];
    label.numberOfLines = 0;
    [self.window.rootViewController.view addSubview:label];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return YES;
}

@end

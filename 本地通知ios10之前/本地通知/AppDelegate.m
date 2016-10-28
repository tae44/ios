//
//  AppDelegate.m
//  本地通知
//
//  Created by jason on 2016/10/25.
//  Copyright © 2016年 jason. All rights reserved.
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
    
    UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge | UIUserNotificationTypeAlert | UIUserNotificationTypeSound categories:nil];
    [application registerUserNotificationSettings:setting];
    
    return YES;
}

/**
 如果应用在后台,通过点击通知的时候打开应用会来到该代理方法
 如果应用在前台,接受到本地通知就会调用该方法

 @param notification 通过哪一个通知来这里
 */
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 0, 300, 300);
    label.backgroundColor = [UIColor redColor];
    label.text = [NSString stringWithFormat:@"%@", notification];
    label.font = [UIFont systemFontOfSize:14.0];
    label.numberOfLines = 0;
    [self.window.rootViewController.view addSubview:label];
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

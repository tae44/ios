//
//  AppDelegate.m
//  iShouldDoo
//
//  Created by jason on 2016/10/13.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "AppDelegate.h"
#import "SYTodoNavigationVc.h"
#import "SYDoneNavigationVc.h"
#import "SYDeleteNavigationVc.h"
#import "SYTodoVc.h"
#import "SYDoneVc.h"
#import "SYDeleteVc.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 创建窗口
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    // 创建tabbar控制器
    UITabBarController *tabbar = [[UITabBarController alloc] init];
    // 创建3个UITableViewController
    SYTodoVc *tableVc1 = [[SYTodoVc alloc] init];
    SYDoneVc *tableVc2 = [[SYDoneVc alloc] init];
    SYDeleteVc *tableVc3 = [[SYDeleteVc alloc] init];
    // 创建3个UINavigationController
    SYTodoNavigationVc *naVc1 = [[SYTodoNavigationVc alloc] initWithRootViewController:tableVc1];
    SYDoneNavigationVc *naVc2 = [[SYDoneNavigationVc alloc] initWithRootViewController:tableVc2];
    SYDeleteNavigationVc *naVc3 = [[SYDeleteNavigationVc alloc] initWithRootViewController:tableVc3];
    // 添加为UITabBarController的子控制器
    tabbar.viewControllers = @[naVc1, naVc2, naVc3];
    // 设置window的根控制器
    window.rootViewController = tabbar;
    // 可用并可见
    [window makeKeyAndVisible];
    self.window = window;
    return YES;
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

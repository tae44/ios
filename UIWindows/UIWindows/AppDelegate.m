//
//  AppDelegate.m
//  UIWindows
//
//  Created by Jason on 16/9/9.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "AppDelegate.h"
#import "SYWindows.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //创建窗口
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //设置颜色
    window.backgroundColor = [UIColor purpleColor];
    
    //设置窗口为主窗口
    //window makeKeyWindow];
    //窗口为什么要有根控制器，是因为窗口上要显示视图
    //UIViewController *vc1 = [[UIViewController alloc] init];
    
    
    SYWindows *vc = [[SYWindows alloc] init];
    window.rootViewController = vc;
    
    //为什么控制器view直接添加到窗口上去不会旋转?
    //旋转事件 -> UIApplication -> UIWindow -> 控制器里
    //[window addSubview:vc.view];
    
    //内部是添加控制器的view到窗口上
    //[window addSubview:vc.view]
    
    //窗口显示的时候，一定要设置为主窗口，并为可见
    [window makeKeyAndVisible];
    self.window = window;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

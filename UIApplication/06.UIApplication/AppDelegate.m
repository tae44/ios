//
//  AppDelegate.m
//  06.UIApplication
//
//  Created by Apple on 14/12/26.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSLog(@"应用程序启动完成");

    //application这个对象是程序创建
    //UIApplication不能有多个实例，一般都不会程序去创建UIApplication对象
    //自己创建会报错
//    Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'There can only be one UIApplication instance.'

    //UIApplication *app = [[UIApplication alloc] init];
    
    //application.networkActivityIndicatorVisible = YES;
    
    
    //添加修改Icon的badge权限
    UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:nil];
    [application registerUserNotificationSettings:setting];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"失去焦点");
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"完全进行入到后台");
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"将进入到前台");
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"获取焦点");
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"程序将中断");
}


-(void)applicationDidReceiveMemoryWarning:(UIApplication *)application{
    NSLog(@"程序接收到内存警告");
    //接收到内存警告，释放一些不必要的资源
}
@end

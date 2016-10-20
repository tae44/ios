//
//  AppDelegate.m
//  03-通信录(RHAddressBook)
//
//  Created by apple on 15/2/3.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "AppDelegate.h"
#import <RHAddressBook/AddressBook.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 1.获取授权状态
    RHAuthorizationStatus status = [RHAddressBook authorizationStatus];
    
    // 2.判断如果是未决定状态
    if (status == RHAuthorizationStatusNotDetermined) {
        
        // 2.1.创建通信录对象
        RHAddressBook *addressBook = [[RHAddressBook alloc] init];
        
        // 2.2.请求授权
        [addressBook requestAuthorizationWithCompletion:^(bool granted, NSError *error) {
            if (granted) {
                NSLog(@"授权成功");
            } else {
                NSLog(@"授权失败");
            }
        }];
    }
    
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

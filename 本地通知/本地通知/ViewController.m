//
//  ViewController.m
//  本地通知
//
//  Created by jason on 2016/10/25.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"
#import <UserNotifications/UserNotifications.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [ViewController registerNotification:5];
}

+ (void)registerNotification:(NSInteger)alerTime {
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    // 需创建一个包含待通知内容的UNMutableNotificationContent对象,注意不是UNNotificationContent,此对象为不可变对象
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.title = @"hello";
    content.body = @"吃饭了吗?";
    content.sound = [UNNotificationSound defaultSound];
    // 在alertTime后推送通知
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:alerTime repeats:NO];
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"FiveSecond" content:content trigger:trigger];
    // 添加推送成功后的处理
    [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"本地通知" message:@"成功添加推送" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:cancelAction];
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
    }];
}

@end

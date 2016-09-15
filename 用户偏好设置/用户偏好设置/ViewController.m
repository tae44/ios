//
//  ViewController.m
//  用户偏好设置
//
//  Created by jason on 16/9/15.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self modify];
    [self read];
}

- (void)modify {
    //修改用户偏好设置数据
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"321" forKey:@"password"];
    [defaults synchronize];
}

- (void)delete {
    //删除用户偏好设置数据
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:@"account"];
    [defaults synchronize];
}

- (void)read {
    //读取用户偏好设置数据
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *account = [defaults objectForKey:@"account"];
    NSString *password = [defaults objectForKey:@"password"];
    BOOL rememberPwd = [defaults objectForKey:@"rememberPwd"];
    BOOL autoLogin = [defaults objectForKey:@"autoLogin"];
    NSLog(@"%@ %@ %d %d",account,password,rememberPwd,autoLogin);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //使用偏好设置保存数据
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //保存数据
    [defaults setObject:@"jason" forKey:@"account"];
    [defaults setObject:@"123" forKey:@"password"];
    [defaults setBool:YES forKey:@"autoLogin"];
    [defaults setBool:YES forKey:@"rememberPwd"];
    //调用同步方法,把数据及时保存到沙盒中
    [defaults synchronize];
}

@end

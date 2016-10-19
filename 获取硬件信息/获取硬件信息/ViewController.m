//
//  ViewController.m
//  获取硬件信息
//
//  Created by jason on 2016/10/19.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"
#import "SystemServices.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@", [SSHardwareInfo deviceName]);
    NSLog(@"%@", [SSHardwareInfo systemVersion]);
    NSLog(@"%@", [SSHardwareInfo systemUptime]);
    NSLog(@"%@", [SSHardwareInfo systemDeviceTypeFormatted:YES]);
    NSLog(@"%@--%@", [SSDiskInfo diskSpace], [SSDiskInfo freeDiskSpace:YES]);
}


@end

//
//  ViewController.m
//  测试FrameWork
//
//  Created by jason on 2016/10/19.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"
#import <SYFrameWork/Tool.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"%ld", [Tool sumNum1:20 num2:290]);
}

@end

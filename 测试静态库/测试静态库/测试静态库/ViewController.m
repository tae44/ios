//
//  ViewController.m
//  测试静态库
//
//  Created by jason on 2016/10/19.
//  Copyright © 2016年 jason. All rights reserved.
//
/*
 Undefined symbols for architecture i386:
 静态库不能在使用i386架构的cpu设备上面运行
 
 i386 : iPhone模拟器 3gs->iPhone5
 x86_64 : iPhone模拟器 5s->6plus
 
 lipo -info 静态库:查看该静态库支持哪些架构
 
 armv7 : iPhone 3gs->4s
 armv7s : iPhone 5->5c
 arm64 : iPhone 5s->6plus
 */

#import "ViewController.h"
#import "testStatic.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%ld", [testStatic sumWithNum1:10 andNum2:20]);
    self.imageView.image = [testStatic loadImage];
}

@end

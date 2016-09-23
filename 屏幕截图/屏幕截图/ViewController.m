//
//  ViewController.m
//  屏幕截图
//
//  Created by jason on 2016/9/23.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 截取当前view为一张图片
    // 使用位图上下文
    UIGraphicsBeginImageContext(self.view.bounds.size);
    // 把当前控制器的view画在位图上下文中
    // render 渲染
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    // 获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 结束位图编辑
    UIGraphicsEndImageContext();
    // 保存
    NSData *imgData = UIImagePNGRepresentation(image);
    [imgData writeToFile:@"/Users/jason/Desktop/data.png" atomically:YES];
}

@end

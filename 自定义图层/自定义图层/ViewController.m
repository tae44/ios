//
//  ViewController.m
//  自定义图层
//
//  Created by jason on 2016/9/27.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"
#import "SYLayer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 把自定义的图层添加的控制器View的图层上
    SYLayer *layer = [SYLayer layer];
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.bounds = CGRectMake(0, 0, 100, 100);
    // 如果自定义的图层,在drawInContext绘制的东西,如果要显示必须手动调用一个方法
    [layer setNeedsDisplay];
    // 设置位置
    layer.anchorPoint = CGPointMake(0, 0);
    [self.view.layer addSublayer:layer];
}

@end

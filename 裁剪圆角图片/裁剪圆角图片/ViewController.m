//
//  ViewController.m
//  裁剪圆角图片
//
//  Created by jason on 2016/9/21.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"
#import "SYCustomView.h"

@interface ViewController ()

@property (nonatomic, weak) SYCustomView *customView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.自定义一个SYCustomView控件，在drawRect中，获取上下文，往上下文中添加一个圆的路径
    //2.自定义的控制器中，添加一个imageName属性
    //3.把自定的view添加到控制器View
    SYCustomView *customView = [[SYCustomView alloc] initWithFrame:CGRectMake(10, 40, 100, 100)];
    //设置图片,边框颜色,边框宽度
    customView.imageName = @"papa";
    customView.boardColor = [UIColor blueColor];
    customView.boardWidth = 3;
    customView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:customView];
    self.customView = customView;
    //4.然后回到drawrect方法画图 调用CGContextClip的方法，裁剪路径之外多余的部分
    //5.画圆的边框，使用CGContextAddEllipseInRect添加圆的路径，并使用CGContextStrokePath画空心圆
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.customView.imageName = @"love";
}

@end

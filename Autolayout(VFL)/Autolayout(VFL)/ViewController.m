//
//  ViewController.m
//  Autolayout(VFL)
//
//  Created by jason on 2016/10/28.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加两个控件
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:blueView];
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:redView];
    // 添加水平方向约束
    NSString *hVFL = @"H:|-30-[blueView]-30-|";
    NSArray *hCons = [NSLayoutConstraint constraintsWithVisualFormat:hVFL options:0 metrics:nil views:@{@"blueView":blueView}];
    [self.view addConstraints:hCons];
    // 添加垂直方向约束
    NSString *vVFL = @"V:|-30-[blueView(50)]-30-[redView(==blueView)]";
    NSArray *vCons = [NSLayoutConstraint constraintsWithVisualFormat:vVFL options:NSLayoutFormatAlignAllRight metrics:nil views:@{@"blueView":blueView,@"redView":redView}];
    [self.view addConstraints:vCons];
    NSLayoutConstraint *redLeftCon = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    [self.view addConstraint:redLeftCon];
}

/**
 练习

 @param redView  红色View
 @param blueView 蓝色View
 */
- (void)testWithView1:(UIView *)redView andView2:(UIView *)blueView {
    NSString *hVFL = @"H:|-30-[blueView]-30-[redView(==blueView)]-30-|";
    NSArray *hCons = [NSLayoutConstraint constraintsWithVisualFormat:hVFL options:NSLayoutFormatAlignAllBottom | NSLayoutFormatAlignAllTop metrics:nil views:@{@"blueView":blueView, @"redView":redView}];
    [self.view addConstraints:hCons];
    NSString *vVFL = @"V:[blueView(50)]-30-|";
    NSArray *vCons = [NSLayoutConstraint constraintsWithVisualFormat:vVFL options:0 metrics:nil views:@{@"blueView":blueView}];
    [self.view addConstraints:vCons];
}

@end

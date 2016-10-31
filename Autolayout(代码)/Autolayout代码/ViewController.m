//
//  ViewController.m
//  Autolayout代码
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
    // 蓝色添加约束
    NSLayoutConstraint *blueLeftCon = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:30];
    [self.view addConstraint:blueLeftCon];
    NSLayoutConstraint *blueTopCon = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:30];
    [self.view addConstraint:blueTopCon];
    NSLayoutConstraint *blueRightCon = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-30];
    [self.view addConstraint:blueRightCon];
    NSLayoutConstraint *blueHeightCon = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:0 constant:50];
    [blueView addConstraint:blueHeightCon];
    // 红色添加约束
    NSLayoutConstraint *redRightCon = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
    [self.view addConstraint:redRightCon];
    NSLayoutConstraint *redTopCon = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:30];
    [self.view addConstraint:redTopCon];
    NSLayoutConstraint *redHeightCon = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
    [self.view addConstraint:redHeightCon];
    NSLayoutConstraint *redLeftCon = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    [self.view addConstraint:redLeftCon];
}

@end

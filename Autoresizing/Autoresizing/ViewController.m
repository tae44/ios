//
//  ViewController.m
//  Autoresizing
//
//  Created by jason on 2016/10/28.
//  Copyright © 2016年 jason. All rights reserved.
//

/*
 UIViewAutoresizingFlexibleWidth        宽度可拉伸
 UIViewAutoresizingFlexibleHeight       高度可拉伸
 UIViewAutoresizingFlexibleLeftMargin   左边可拉伸,距离右边距离固定
 UIViewAutoresizingFlexibleRightMargin  右边可拉伸,距离左边距离固定
 UIViewAutoresizingFlexibleTopMargin    上边可拉伸,距离下边距离固定
 UIViewAutoresizingFlexibleBottomMargin 下边可拉伸,距离上边距离固定
 UIViewAutoresizingNone                 不拉伸也不伸缩,默认是这种情况
 */

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) UIView *redView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *redView = [[UIView alloc] init];
    redView.frame = CGRectMake(0, 0, 100, 100);
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    self.redView = redView;
    UIView *blueView = [[UIView alloc] init];
    blueView.frame = CGRectMake(0, 50, 100, 50);
    blueView.backgroundColor = [UIColor blueColor];
    blueView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
    [redView addSubview:blueView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGRect redFrame = self.redView.frame;
    redFrame.size.width += 50;
    redFrame.size.height += 50;
    self.redView.frame = redFrame;
}

@end

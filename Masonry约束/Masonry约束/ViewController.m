//
//  ViewController.m
//  Masonry约束
//
//  Created by jason on 2016/11/1.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

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
    // 添加约束
    // 练习1:让蓝色的View居中,并且宽度和高度都是100
    // 如果是基本数据类型的话:需要使用.mas_equalTo
    // 如果是相对于其他空间的约束:需要使用make.centerX.equalTo
    // offset用于偏移量
//    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(100);
//        make.height.mas_equalTo(100);
//        make.centerX.equalTo(self.view.mas_centerX);
//        make.centerY.equalTo(self.view.mas_centerY);
//    }];
    // 练习2:底部有两个View,距离左右下都是30,高度是50
//    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view.mas_left).offset(30);
//        make.bottom.equalTo(self.view.mas_bottom).offset(-30);
//        make.right.equalTo(redView.mas_left).offset(-30);
//        make.height.mas_equalTo(50);
//    }];
//    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(self.view.mas_right).offset(-30);
//        make.bottom.equalTo(blueView.mas_bottom);
//        make.height.equalTo(blueView.mas_height);
//        make.width.equalTo(blueView.mas_width);
//    }];
    // 练习3:顶部有一个蓝色View,距离上左右都是30,高度是50
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(30);
        make.top.equalTo(self.view.mas_top).offset(30);
        make.right.equalTo(self.view.mas_right).offset(-30);
        make.height.mas_equalTo(50);
    }];
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(blueView.mas_right);
        make.top.equalTo(blueView.mas_bottom).offset(30);
        make.height.equalTo(blueView.mas_height);
        make.left.equalTo(blueView.mas_centerX);
    }];
    
    // 将之前的约束全部删除,添加新的约束
    // [blueView mas_remakeConstraints:<#^(MASConstraintMaker *make)block#>]
    // 如果之前已经有约束,则更新新的约束,如果没有约束,则添加约束
    // [blueView mas_updateConstraints:<#^(MASConstraintMaker *make)block#>]
}


@end

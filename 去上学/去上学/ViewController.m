//
//  ViewController.m
//  去上学
//
//  Created by 123 on 16/9/6.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@property (nonatomic, weak) UIImageView *sun;

@property (nonatomic, weak) UIImageView *child;

@property (nonatomic, weak) UIImageView *content;

@property (nonatomic, assign, getter=isMove) BOOL move;

@property (weak, nonatomic) IBOutlet UIScrollView *backgroudScrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置代理为自己
    self.backgroudScrollView.delegate = self;
    //添加背景
    UIImageView *backgroud = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"520_userguid_bg"]];
    [self.backgroudScrollView addSubview:backgroud];
    //添加云彩
    UIImageView *cloud = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"520_userguid_cloud"]];
    [self.backgroudScrollView addSubview:cloud];
    //添加道路
    UIImageView *road = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"520_userguid_fg"]];
    [self.backgroudScrollView addSubview:road];
    //添加其他背景
    UIImageView *other = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"520_userguid_cg"]];
    [self.backgroudScrollView addSubview:other];
    //设置滚动范围
    self.backgroudScrollView.contentSize = CGSizeMake(2832, 568);
    //添加太阳
    UIImageView *sun = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"520_userguid_sun"]];
    //不跟随移动的图片放到self.view中
    [self.view addSubview:sun];
    sun.frame = CGRectMake(200, 30, 100, 100);
    self.sun = sun;
    //添加小人
    UIImageView *child = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"520_userguid_person_taitou_2"]];
    [self.view addSubview:child];
    child.frame = CGRectMake(5, 323, 200, 200);
    self.child = child;
    //添加图片文字
    UIImageView *content = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"520_userguid_words_5"]];
    [self.view addSubview:content];
    content.frame = CGRectMake(40, 158, 240, 128);
    content.hidden = YES;
    self.content = content;
}

#pragma mark - ScrollView的代理方法
//拖动的时候调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.sun.transform = CGAffineTransformRotate(self.sun.transform, 0.5);
    if (!self.move) {
        self.child.image = [UIImage imageNamed:@"520_userguid_person_taitou_2"];
        self.move = !self.move;
    } else {
        self.child.image = [UIImage imageNamed:@"520_userguid_person_taitou_1"];
        self.move = !self.move;
    }
}

//已经结束减速之后调用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.content.hidden = NO;
    });
}

@end

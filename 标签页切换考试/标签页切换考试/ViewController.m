//
//  ViewController.m
//  标签页切换考试
//
//  Created by 123 on 16/9/6.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//新闻按钮
@property (weak, nonatomic) IBOutlet UIButton *newsBtn;
//最新动态按钮
@property (weak, nonatomic) IBOutlet UIButton *trendsBtn;
//黑马按钮
@property (weak, nonatomic) IBOutlet UIButton *blackHorseBtn;
//下面的红线
@property (weak, nonatomic) IBOutlet UIView *lineView;

- (IBAction)clickNewsBtn;

- (IBAction)clickTrendsBtn;

- (IBAction)clickBlackBtn;

@end

@implementation ViewController

/**
 *  平移红线的位置
 *
 *  @param x x的坐标
 */
- (void)animationChangeWithX:(CGFloat)x {
    [UIView animateWithDuration:0.5 animations:^{
        self.lineView.frame = CGRectMake(x, 117, 76, 2);
    }];
}

/**
 *  设置按钮属性
 *
 *  @param btn 按钮对象
 */
- (void)setColorToBtnTitle:(UIButton *)btn{
    switch (btn.tag) {
        case 1:
            self.trendsBtn.selected = NO;
            self.blackHorseBtn.selected = NO;
            [self animationChangeWithX:37];
            break;
        case 2:
            self.newsBtn.selected = NO;
            self.blackHorseBtn.selected = NO;
            [self animationChangeWithX:117];
            break;
        case 3:
            self.newsBtn.selected = NO;
            self.trendsBtn.selected = NO;
            [self animationChangeWithX:197];
            break;
        default:
            break;
    }
    if (btn.selected) {
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.newsBtn.selected = YES;
    [self setColorToBtnTitle:self.newsBtn];
}

- (IBAction)clickNewsBtn {
    self.newsBtn.selected = YES;
    [self setColorToBtnTitle:self.newsBtn];
}

- (IBAction)clickTrendsBtn {
    self.trendsBtn.selected = YES;
    [self setColorToBtnTitle:self.trendsBtn];
}

- (IBAction)clickBlackBtn {
    self.blackHorseBtn.selected = YES;
    [self setColorToBtnTitle:self.blackHorseBtn];
}

@end

//
//  ViewController.m
//  背景平铺
//
//  Created by jason on 2016/9/23.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加控制器的背景
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"textBg"]];
    // 获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"news" ofType:nil];
    // 读取文件中的文字
    NSString *news = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    // 显示多行数据并可编辑
    UITextView *textView = [[UITextView alloc] initWithFrame:self.view.bounds];
    // 设置文本
    textView.text = news;
    // 设置文字类型和大小
    textView.font = [UIFont fontWithName:@"Verdana" size:20];
    // 设置文字背景为透明
    textView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:textView];
    // 当前系统可用字体
    // NSLog(@"%@", [UIFont familyNames]);
    
    // 画一个虚线的背景图片
    UIImage *dashBgImage = [self dashBgImage];
    // 创建一个ImageView，添加到TextView的第一个位置
    UIImageView *bgImageView = [[UIImageView alloc] init];
    // 背景设置大小的时候，是根文字的字数和字体大小决定
    // 计算文本的size
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    // 文字需要的尺寸
    CGSize textNeedSize = [news boundingRectWithSize:CGSizeMake(screenW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:textView.font} context:nil].size;
    bgImageView.frame = CGRectMake(0, 0, textNeedSize.width, textNeedSize.height);
    bgImageView.backgroundColor = [UIColor colorWithPatternImage:dashBgImage];
    [textView insertSubview:bgImageView atIndex:0];
}

/**
 生成带虚线的背景图片

 @return 带虚线的背景图片
 */
- (UIImage *)dashBgImage {
    // 使用位图上下文
    CGFloat bgW = self.view.bounds.size.width;
    CGFloat bgH = 22;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(bgW, bgH), NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 计算线的位置
    CGFloat lineH = 1;
    CGFloat lineY = bgH - lineH;
    // 设置虚线每一段的距离长度
    CGFloat lengths[2] = {10,5};
    // 设置虚线
    [[UIColor blueColor] set];
    CGContextSetLineDash(context, 0, lengths, 2);
    CGPoint points[2] = {{0,lineY},{bgW,lineY}};
    CGContextAddLines(context, points, 2);
    CGContextStrokePath(context);
    // 获取背景图片
    UIImage *bgImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束编辑
    UIGraphicsEndImageContext();
    return bgImage;
}

@end

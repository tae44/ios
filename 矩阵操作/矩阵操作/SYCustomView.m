//
//  SYCustomView.m
//  矩阵操作
//
//  Created by jason on 2016/9/21.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYCustomView.h"

@implementation SYCustomView

- (void)drawRect:(CGRect)rect {
    //矩阵操作 平移、绽放，旋转
    CGContextRef context = UIGraphicsGetCurrentContext();
#warning qurtz2d的平移，要在绘制之前
    //平移
    CGContextTranslateCTM(context, 0, 50);
    //缩放
    CGContextScaleCTM(context, 1.5, 1.5);
    //旋转
    // 负数 逆时针/ 正数 顺时针
    // 围绕左上角(0,0) 旋转
    CGContextRotateCTM(context, -0.3);
    
    //定义三角形三个点
    CGPoint point[3] = {{50,20},{100,80},{10,80}};
    CGContextAddLines(context, point, 3);
    CGContextClosePath(context);
    //画线
    CGPoint lines[2] = {{10,20},{80,80}};
    CGContextAddLines(context, lines, 2);
    CGContextStrokePath(context);
    
#warning 使用UIkit绘图方法
    //以前一直都要获取上下文，
    //UIKit的方法,虽然不用获取上下文,但内部最终都会获取上下文进行绘制
    //画实心
    UIRectFill(CGRectMake(10, 10, 100, 100));
    //画空心
    //UIRectFrame(CGRectMake(10, 110, 50, 50));
}

@end

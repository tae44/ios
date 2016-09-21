//
//  SYCustomView.m
//  图形的上下文栈
//
//  Created by jason on 2016/9/21.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYCustomView.h"

@implementation SYCustomView

- (void)drawRect:(CGRect)rect {
    // 需求： 先画一个矩形，颜色为红色，线宽为3
    //       再画一个矩形，颜色为黑色，线宽为默认
    CGContextRef context = UIGraphicsGetCurrentContext();
    //保存一个当前上下文的绘图状态到一个栈里面
    //前缀G代表Graphics(绘图)
    CGContextSaveGState(context);
    //画红色,线宽为3的矩形
    CGContextAddRect(context, CGRectMake(10, 10, 100, 100));
    CGContextSetLineWidth(context, 3);
    [[UIColor redColor] set];
    CGContextStrokePath(context);
    //画黑色,线宽为默认的矩形
    //[[UIColor blackColor] set];
    //CGContextSetLineWidth(context, 1);
    //恢复之前的上下文状态,省去了上面重新设置属性
#warning 恢复状态不能随便调用，保存了多少次绘图状态，就调用多少次
    CGContextRestoreGState(context);
    CGContextAddRect(context, CGRectMake(10, 120, 50, 50));
    CGContextStrokePath(context);
}

@end

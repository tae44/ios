//
//  SYCustomView.m
//  绘图中的Path
//
//  Created by jason on 2016/9/21.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYCustomView.h"

@implementation SYCustomView

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    //每调用一次,往上下文添加路径
//    CGContextMoveToPoint(context, 10, 10);
//    CGContextAddLineToPoint(context, 100, 100);
//    CGContextAddRect(context, CGRectMake(20, 20, 50, 50));
//    CGContextStrokePath(context);
    
    //先把所有路径定义好,然后一次性往上下文中添加
    CGMutablePathRef path = CGPathCreateMutable();
    CGPoint point[2] = {{10,10},{100,100}};
    CGPathAddLines(path, NULL, point, 2);
    CGPathAddRect(path, NULL, CGRectMake(20, 20, 50, 50));
    
    // 设置圆的路径
    //CGPathAddEllipseInRect(path, NULL, CGRectMake(10, 10, 100, 100));
    //CGPathAddEllipseInRect(path, NULL, CGRectMake(20, 20, 80, 80));
    
    //添加弧的路径
    //CGPathAddArc(path, NULL, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, bool clockwise);
    
    //把路径添加到上下文
    CGContextAddPath(context, path);
    CGContextStrokePath(context);
    
    //开发过程中,在ARC环境中C语言的资源是不会自动释放
    //什么情况下创建的C语言资源需要释放:以create,retain,copy创建的数据要释放
    //CGPathRelease(path);
    //通用
    CFRelease(path);
}

@end

//
//  LineView.m
//  画线及图形
//
//  Created by jason on 16/9/19.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "LineView.h"

@implementation LineView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGFloat w = rect.size.width;
    CGFloat h = rect.size.height;
    
    //画图片
    UIImage *image = [UIImage imageNamed:@"papa"];
    //[image drawAtPoint:CGPointZero];
    //[image drawInRect:CGRectMake(10, 10, 100, 100)];
    //平铺
    [image drawAsPatternInRect:CGRectMake(0, 0, 180, 180)];
    
    //画文字
    NSString *text = @"B04.画文字和图片sdfasdfsdab这个方法不会换行adasdfasdfsdabadasdfa这个方法不会换行B04.画文字和图片sdfasdfsdab这个方法不会换行adasdfasdfsdabadasdfa这个方法Putranto表示，发现这些残骸的位置距离飞机最后被雷达捕获的位置大约10公里。报道称，这名官员展示了10张照片，照片中的物体类似飞机舱门、紧急滑道以及一个方形的箱子。";
    //这个方法不会换行
    //[text drawAtPoint:CGPointMake(10, 100) withAttributes:nil];
    //设置字体的样式
    NSDictionary *attr = @{NSFontAttributeName:[UIFont systemFontOfSize:13],NSForegroundColorAttributeName:[UIColor yellowColor]};
    //指定宽度和高度
    [text drawInRect:CGRectMake(0, 0, w, h * 0.5) withAttributes:attr];
}

/**
 画圆
 */
- (void)drawCircle {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(context, CGRectMake(10, 10, 100, 100));
    CGContextStrokePath(context);
}

/**
 画弧
 */
- (void)drawArc {
    /**
     *x,y 圆心
     *radius 半径
     *startAngle 画弧的起始位置
     *endAngel 画弧的结束位置
     * clockwise 0 顺针 1 逆时针
     */
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddArc(context, 100, 100, 60, 0, M_PI, 1);
    CGContextClosePath(context);
    CGContextStrokePath(context);
}

/**
 画扇形
 */
- (void)drawSector{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 100, 100);
    CGContextAddArc(context, 100, 100, 60, - M_PI_4, -3 * M_PI_4, 1);
    CGContextClosePath(context);
    CGContextStrokePath(context);
}

/**
 画矩形
 */
- (void)drawrect {
    //获取上下文,上下文的输出目录就是self(view)
    CGContextRef context = UIGraphicsGetCurrentContext();
    //设置线颜色
    CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);
    //设置起点
    CGContextAddRect(context, CGRectMake(10, 10, 100, 100));
    //渲染
    CGContextStrokePath(context);
}

/**
 画三角形
 */
- (void)drawTriangle {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);
    CGContextMoveToPoint(context, 10, 10);
    //设置另外三个点
    CGContextAddLineToPoint(context, 110, 10);
    CGContextAddLineToPoint(context, 110, 110);
    //关闭路径
    CGContextClosePath(context);
    CGContextStrokePath(context);
}

/**
 画线
 */
- (void)drawLine {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);
    //设置线宽
    CGContextSetLineWidth(context, 13);
    //设置线的头尾样式
    CGContextSetLineCap(context, kCGLineCapButt);
    //设置连接点的样式
    CGContextSetShouldSubpixelQuantizeFonts(context, kCGLineJoinRound);
    CGContextMoveToPoint(context, 10, 10);
    CGContextAddLineToPoint(context, 30, 100);
    CGContextAddLineToPoint(context, 110, 110);
    CGContextStrokePath(context);
}

@end

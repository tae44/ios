//
//  SYPaintView.m
//  涂鸦
//
//  Created by 123 on 16/9/23.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYPaintView.h"

@interface SYPaintView ()

/**
 存放所有线的数组
 */
@property (nonatomic, strong) NSMutableArray *allLines;

@end

@implementation SYPaintView

- (NSMutableArray *)allLines {
    if (!_allLines) {
        _allLines = [NSMutableArray array];
    }
    return _allLines;
}

/**
 懒加载颜色属性,如果颜色没有设置,默认为黑色
 */
- (UIColor *)color {
    if (!_color) {
        _color = [UIColor blackColor];
    }
    return _color;
}

/**
 懒加载线宽属性,如果没有设置,默认为1
 */
- (CGFloat)width {
    if (!_width) {
        _width = 1;
    }
    return _width;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    NSInteger count = self.allLines.count;
    //设置线宽
    CGContextSetLineWidth(context, self.width);
    for (NSInteger i = 0; i < count; i++) {
        NSArray *line = self.allLines[i];
        for (NSInteger j = 0; j < line.count; j++) {
            CGPoint point = [line[j] CGPointValue];
            //j为0表示为一条线的起点
            if (j == 0) {
                CGContextMoveToPoint(context, point.x, point.y);
            } else {
                CGContextAddLineToPoint(context, point.x, point.x);
            }
        }
    }
    [self.color set];
    CGContextStrokePath(context);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //创建一条线的数组
    NSMutableArray *line = [NSMutableArray array];
    [self.allLines addObject:line];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    //获取当前的点
    CGPoint currentPoint = [touch locationInView:touch.view];
    //获取线的数组
    NSMutableArray *line = [self.allLines lastObject];
    //将点放入到线的数组中去
    [line addObject:[NSValue valueWithCGPoint:currentPoint]];
    //重绘
    [self setNeedsDisplay];
}

/**
 删除所有线数组中最后一条线
 */
- (void)back {
    [self.allLines removeLastObject];
    [self setNeedsDisplay];
}

/**
 将所有线数组中的数据清空
 */
- (void)clean {
    [self.allLines removeAllObjects];
    [self setNeedsDisplay];
}

/**
 设置线宽之后重绘图形
 */
- (void)changeLineWidth {
    [self setNeedsDisplay];
}

@end

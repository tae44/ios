//
//  CZPaintView.m
//  B03.涂鸦-[UIBezierPath]
//
//  Created by apple on 15-1-2.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "SYPaintView.h"

@interface SYPaintView()

/**
 * 存放所有 “线的路径” 数组
 */
@property(nonatomic,strong)NSMutableArray *linesPath;

@end

@implementation SYPaintView

-(NSMutableArray *)linesPath{
    if (!_linesPath) {
        _linesPath = [NSMutableArray array];
    }
    return _linesPath;
}

/** 实现方法：使用UIBezierPath类
 一条线 就使用一个 UIBezierPath对象
 * 0.需要一个数组 存放 UIBezierPath 对象
 * 1.监听move方法
 * 2.move方法里获取当前 "点" 添加到 UIBezierPath 对象
 * 3.渲染
 */

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:touch.view];

    // 创建一个UIBezierPath对象，添加到数组
    UIBezierPath *linePath = [UIBezierPath bezierPath];

    // 设置path起始点
    [linePath moveToPoint:touchPoint];
    
    // 数组中存放UIBezierPath对象
    [self.linesPath addObject:linePath];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:touch.view];

    // 当前点的 "线的路径"
    UIBezierPath *currentLinePath = [self.linesPath lastObject];
    
    [currentLinePath addLineToPoint:touchPoint];
    
    // 重绘
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
#warning UIBezierPath不需要使用到上下文， 内部实现
    // 遍历所有path对象
    NSInteger pathCount = self.linesPath.count;
    for (NSInteger i = 0; i < pathCount; i++) {
        // 取Path对象
        UIBezierPath *path = self.linesPath[i];
        // 设置线宽、 首尾样式、 连接样式
        path.lineWidth = 3;
        path.lineCapStyle = kCGLineCapRound;
        path.lineJoinStyle = kCGLineJoinRound;
        // 渲染
        [path stroke];
    }
}

@end

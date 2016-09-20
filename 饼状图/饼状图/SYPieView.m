//
//  SYPieView.m
//  饼状图
//
//  Created by jason on 16/9/20.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYPieView.h"

@implementation SYPieView

- (void)drawRect:(CGRect)rect {
    // 需求:根据sections的数据,绘制多个扇形
    //获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //根据sections的数据,计算扇形的起始位置和结束位置来画扇形
    NSInteger count = self.sections.count;
    //如果没有数据则直接返回
    if (count == 0) return;
    //圆心
    CGFloat centerX = rect.size.width * 0.5;
    CGFloat centerY = rect.size.height * 0.5;
    //半径就是x的中心点
    CGFloat radius = centerX;
    //计算所有组的总数
    NSInteger sum = 0;
    for (NSInteger i = 0; i < count; i++) {
        sum += [self.sections[i] integerValue];
    }
    //设置扇形的起始位置为0
    CGFloat startAngle = 0;
    for (NSInteger i = 0; i < count; i++) {
        //计算每组占用的比例
        CGFloat scale = [self.sections[i] integerValue] / (sum * 1.0);
        //指定颜色
        UIColor *sectionColor = self.sectionColors[i];
        [sectionColor set];
        //计算结束的位置　＝　起始位置 + 需要的画的弧度
        CGFloat endAngle = startAngle + scale * 2 * M_PI;
        //指定 "弧" 的中心点路径
        CGContextMoveToPoint(context, centerX, centerY);
        //画弧
        CGContextAddArc(context, centerX, centerY, radius, startAngle, endAngle, 0);
        //渲染
        CGContextFillPath(context);
        //重新设置起始位置,供下一次循环使用
        startAngle = endAngle;
    }
}

@end

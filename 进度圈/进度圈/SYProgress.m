//
//  SYProgress.m
//  进度圈
//
//  Created by jason on 16/9/19.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYProgress.h"

@implementation SYProgress

- (void)drawRect:(CGRect)rect {
    CGFloat textW = 20;
    CGFloat textH = 20;
    CGFloat x = (rect.size.width - textW) * 0.5;
    CGFloat y = (rect.size.height - textH) * 0.5;
    //画文字
    NSString *text = [NSString stringWithFormat:@"%.1f", self.progress];
    [text drawInRect:CGRectMake(x, y, textW, textH) withAttributes:nil];
    //画弧
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGFloat radius = (rect.size.width - 10) * 0.5;
    CGFloat endAngle = self.progress * 2 * M_PI - M_PI_4;
    CGContextAddArc(context, rect.size.width * 0.5, rect.size.height * 0.5, radius, - M_PI_4, endAngle, 0);
    CGContextStrokePath(context);
}

- (void)setProgress:(float)progress {
    _progress = progress;
    //重绘
    [self setNeedsDisplay];
}

@end

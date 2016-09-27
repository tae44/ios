//
//  SYLayer.m
//  自定义图层
//
//  Created by jason on 2016/9/27.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYLayer.h"

@implementation SYLayer

- (void)drawInContext:(CGContextRef)ctx {
    // 画一个半径为40的圆
    CGContextSetRGBFillColor(ctx, 255/255.0, 240/255.0, 132/255.0, 1);
    CGContextFillEllipseInRect(ctx, CGRectMake(0, 0, 100, 100));
}

@end

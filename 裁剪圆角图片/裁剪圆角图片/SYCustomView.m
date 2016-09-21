//
//  SYCustomView.m
//  裁剪圆角图片
//
//  Created by jason on 2016/9/21.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYCustomView.h"

@implementation SYCustomView

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    //指定圆的路径，并圆外面多余的剪切掉(CGContextClip)
    CGRect imageRect = CGRectMake(0, 0, rect.size.width, rect.size.height);
    CGContextAddEllipseInRect(context, imageRect);
    CGContextClip(context);
    //把图片显示在UIView
    UIImage *image = [UIImage imageNamed:self.imageName];
    [image drawInRect:imageRect];
    //添加圆形边框和颜色
    CGContextSetLineWidth(context, self.boardWidth);
    [self.boardColor set];
    CGContextAddEllipseInRect(context, imageRect);
    CGContextStrokePath(context);
}

- (void)setImageName:(NSString *)imageName {
    _imageName = imageName;
    [self setNeedsDisplay];
}

@end

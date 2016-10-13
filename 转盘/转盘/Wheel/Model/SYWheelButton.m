//
//  SYWheelButton.m
//  转盘
//
//  Created by jason on 2016/10/11.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYWheelButton.h"

@implementation SYWheelButton

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    // 固定图片大小
    CGFloat imgW = 48;
    CGFloat imgH = 40;
    CGFloat imgX = (contentRect.size.width - imgW) * 0.5;
    return CGRectMake(imgX, 20, imgW, imgH);
}

- (void)setHighlighted:(BOOL)highlighted {}

@end

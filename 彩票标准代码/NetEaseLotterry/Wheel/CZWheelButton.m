//
//  CZWheelButton.m
//  转盘
//
//  Created by Vincent_Guo on 14-9-7.
//  Copyright (c) 2014年 vgios. All rights reserved.
//

#import "CZWheelButton.h"

@implementation CZWheelButton

-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat imageW = 40;
    CGFloat imageH = 47;
    CGFloat imageX = (contentRect.size.width - imageW) * 0.5;
    CGFloat imageY = 20;
    
    return CGRectMake(imageX, imageY, imageW, imageH);
}

-(void)setHighlighted:(BOOL)highlighted{
    
}

@end

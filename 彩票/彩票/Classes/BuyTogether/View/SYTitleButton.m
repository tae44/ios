//
//  SYTitleButton.m
//  彩票
//
//  Created by jason on 2016/10/9.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYTitleButton.h"

@implementation SYTitleButton

- (void)awakeFromNib {
    [super awakeFromNib];
    // 设置图片的显示样式
    self.imageView.contentMode = UIViewContentModeCenter;
}

/**
 设置标题位置
 */
- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGFloat titleW = contentRect.size.width - 30;
    CGFloat titleH = contentRect.size.height;
    return CGRectMake(0, 0, titleW, titleH);
}

/**
 设置图片位置
 */
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat imageW = 30;
    CGFloat imageH = contentRect.size.height;
    CGFloat imageX = contentRect.size.width - 30;
    return CGRectMake(imageX, 0, imageW, imageH);
}

@end

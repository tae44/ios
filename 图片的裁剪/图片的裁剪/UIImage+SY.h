//
//  UIImage+SY.h
//  图片的裁剪
//
//  Created by jason on 2016/9/23.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SY)

/**
 生成带水印的背景图片

 @param bgImageName    背景图片
 @param waterImageName 水印图片
 @param scale          图片生成的比例

 @return 添加了水印的背景图片
 */
+ (UIImage *)waterImageWithBgImageName:(NSString *)bgImageName waterImageName:(NSString *)waterImageName scale:(CGFloat)scale;

/**
 给输入的图片剪切圆形边框

 @param imageName   需要裁剪的图片
 @param borderColor 边框颜色
 @param borderWidth 边框宽度

 @return 裁剪后的图片
 */
+ (UIImage *)circleImageWithImageName:(NSString *)imageName borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;

@end

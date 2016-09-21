//
//  UIImage+SY.h
//  水印照片
//
//  Created by jason on 2016/9/21.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SY)

/**
 给背景图片增加水印

 @param bgImageName    背景图片名称
 @param waterImageName 水印图片名称
 @param scale          图片生成的比例

 @return 添加完水印的照片
 */
+ (UIImage *)waterImageWithBgImageName:(NSString *)bgImageName waterImageName:(NSString *)waterImageName scale:(CGFloat)scale;

@end

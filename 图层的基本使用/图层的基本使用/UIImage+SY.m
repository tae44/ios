//
//  UIImage+SY.m
//  图片的裁剪
//
//  Created by jason on 2016/9/23.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "UIImage+SY.h"

@implementation UIImage (SY)

+ (UIImage *)waterImageWithBgImageName:(NSString *)bgImageName waterImageName:(NSString *)waterImageName scale:(CGFloat)scale {
    // 创建背景图片
    UIImage *bgImage = [UIImage imageNamed:bgImageName];
    // 创建一个位图【图片】，开启位图上下文
    // size:位图大小
    // opaque: alpha通道 YES:不透明/ NO透明 使用NO,生成的更清析
    // scale 比例 设置0.0为屏幕的比例
    // scale 是用于获取生成图片大小 比如位图大小：20X20 / 生成一张图片：（20 *scale X 20 *scale)
    UIGraphicsBeginImageContextWithOptions(bgImage.size, NO, scale);
    // 画背景图
    [bgImage drawInRect:CGRectMake(0, 0, bgImage.size.width, bgImage.size.height)];
    // 创建水印图片
    UIImage *waterImage = [UIImage imageNamed:waterImageName];
    CGFloat waterScale = 0.4;
    CGFloat waterW = waterImage.size.width * waterScale;
    CGFloat waterH = waterImage.size.height * waterScale;
    CGFloat waterX = bgImage.size.width - waterW;
    CGFloat waterY = bgImage.size.height - waterH;
    // 画水印
    [waterImage drawInRect:CGRectMake(waterX, waterY, waterW, waterH)];
    // 从位图上下文中获取当前编辑的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束当前位置编辑
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage *)circleImageWithImageName:(NSString *)imageName borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth {
    // 创建需要裁剪的图片
    UIImage *img = [UIImage imageNamed:imageName];
    CGRect imgRect = CGRectMake(0, 0, img.size.width, img.size.height);
    // 开启位图上下文
    UIGraphicsBeginImageContextWithOptions(img.size, NO, 0.0);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 指定一个圆形路径,将圆形之外的剪切掉
    CGContextAddEllipseInRect(context, imgRect);
    CGContextClip(context);
    // 添加图片
    [img drawInRect:imgRect];
    // 设置边框的宽度
    CGContextSetLineWidth(context, borderWidth);
    // 设置边框颜色
    [borderColor set];
    // 生成边框路径
    CGContextAddEllipseInRect(context, imgRect);
    // 渲染
    CGContextStrokePath(context);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage *)captureImage:(UIView *)captureView {
    // 创建位图上下文
    UIGraphicsBeginImageContext(captureView.bounds.size);
    // 把view渲染到位图上下文中
    [captureView.layer renderInContext:UIGraphicsGetCurrentContext()];
    // 获取图片
    UIImage *captureImg = UIGraphicsGetImageFromCurrentImageContext();
    // 结束位图编辑
    UIGraphicsEndImageContext();
    return captureImg;
}

+ (UIImage *)cornerImageWithImageName:(NSString *)imageName cornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    UIImage *sourceImage = [UIImage imageNamed:imageName];
    // 开启位图上下文
    UIGraphicsBeginImageContextWithOptions(sourceImage.size, NO, 0.0);
    // 创建一个新图层
    CALayer *layer = [CALayer layer];
    // 设置图层的大小
    layer.bounds = CGRectMake(0, 0, sourceImage.size.width, sourceImage.size.height);
    // 设置内容
    layer.contents = (id)sourceImage.CGImage;
    // 设置圆角
    layer.cornerRadius = cornerRadius;
    // 裁剪
    layer.masksToBounds = YES;
    // 设置边框宽度
    layer.borderWidth = borderWidth;
    // 设置边框颜色
    layer.borderColor = borderColor.CGColor;
    // 将图层图片发送到上下文
    [layer renderInContext:UIGraphicsGetCurrentContext()];
    // 从位图上下文获取新图片
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    // 结束位图编辑
    UIGraphicsEndImageContext();
    return newImg;
}

@end

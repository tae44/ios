//
//  UIImage+CZ.m
//  NetEaseLotterry
//
//  Created by Vincent_Guo on 14-9-2.
//  Copyright (c) 2014年 vgios. All rights reserved.
//

#import "UIImage+CZ.h"

@implementation UIImage (CZ)


+(UIImage *)resizeImage:(NSString *)name{
    UIImage *normal = [UIImage imageNamed:name];
    CGFloat top = normal.size.height * 0.5;
    CGFloat left = normal.size.width * 0.5;
    UIEdgeInsets inserts = UIEdgeInsetsMake(top, left, top, left);
    return [normal resizableImageWithCapInsets:inserts];
}

+(UIImage *)resizeImageUseIOS2:(NSString *)name{
    UIImage *normal = [UIImage imageNamed:name];
    CGFloat top = normal.size.height * 0.5;
    CGFloat left = normal.size.width * 0.5;
    return [normal stretchableImageWithLeftCapWidth:left topCapHeight:top];
}


@end

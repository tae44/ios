//
//  UIImage+Extensiton.m
//  A01-QQ聊天列表
//
//  Created by Apple on 14/12/21.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "UIImage+Extensiton.h"

@implementation UIImage (Extensiton)
+ (instancetype)resizeImage:(NSString *)imgName
{
    UIImage *bgImage =  [UIImage imageNamed:imgName];
    //缩放图片
    //bgImage = [bgImage stretchableImageWithLeftCapWidth:bgImage.size.width / 2 topCapHeight:bgImage.size.height / 2];
    bgImage = [bgImage resizableImageWithCapInsets:UIEdgeInsetsMake(0, 20, 0, 20) resizingMode:UIImageResizingModeStretch];
    return bgImage;
}
@end

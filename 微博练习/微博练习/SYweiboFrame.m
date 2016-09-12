//
//  SYweiboFrame.m
//  微博练习
//
//  Created by 123 on 16/8/31.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYweiboFrame.h"
#import "SYweibo.h"

@implementation SYweiboFrame

//定义名称或内容字体的方法
- (CGSize)sizeWithText:(NSString *)text maxSize:(CGSize)maxSize fontSize:(CGFloat)fontSize {
    CGSize nameSize = [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size;
    return nameSize;
}

//重写weibo数据的setter方法
- (void)setWeibo:(SYweibo *)weibo {
    _weibo = weibo;
    //定义用户头像Frame
    CGFloat margin = 10;
    CGFloat iconW = 30;
    CGFloat iconH = 30;
    CGFloat iconX = margin;
    CGFloat iconY = margin;
    _iconFrame = CGRectMake(iconX, iconY, iconW, iconH);
    //定义用户名称Frame
    CGSize nameSize = [self sizeWithText:self.weibo.name maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT) fontSize:SYNameFont];
    CGFloat nameX = CGRectGetMaxX(_iconFrame) + margin;
    CGFloat nameY = iconY - (iconH - nameSize.height) / 2;
    _nameFrame = CGRectMake(nameX, nameY, nameSize.width, nameSize.height);
    //定义VIP图标的Frame
    CGFloat vipW = 14;
    CGFloat vipH = 14;
    CGFloat vipY = nameY;
    CGFloat vipX = CGRectGetMaxX(_nameFrame) + margin;
    _vipFrame = CGRectMake(vipX, vipY, vipW, vipH);
    //定义微博内容Frame
    CGSize textSize = [self sizeWithText:self.weibo.text maxSize:CGSizeMake(355, MAXFLOAT) fontSize:SYTextFont];
    CGFloat textX = iconX;
    CGFloat textY = CGRectGetMaxY(_iconFrame) + margin;
    _textFrame = CGRectMake(textX, textY, textSize.width, textSize.height);
    //定义内容图片Frame
    if (self.weibo.picture) {
        CGFloat pictureW = 100;
        CGFloat pictureH = 100;
        CGFloat pictureX = iconX;
        CGFloat pictureY = CGRectGetMaxY(_textFrame) + margin;
        _pictureFrame = CGRectMake(pictureX, pictureY, pictureW, pictureH);
        //定义不同的行高
        _rowHeight = CGRectGetMaxY(_pictureFrame) + margin;
    } else {
        _rowHeight = CGRectGetMaxY(_textFrame) + margin;
    }
}

@end

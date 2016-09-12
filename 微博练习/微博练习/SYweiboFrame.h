//
//  SYweiboFrame.h
//  微博练习
//
//  Created by 123 on 16/8/31.
//  Copyright © 2016年 jason. All rights reserved.
//

//定义字体大小
#define SYNameFont 15
#define SYTextFont 14

#import <UIKit/UIKit.h>
@class SYweibo;

//定义微博空间的Frame模型
@interface SYweiboFrame : NSObject

//微博数据
@property (nonatomic , strong) SYweibo *weibo;

//头像Frame
@property (nonatomic , assign, readonly) CGRect iconFrame;

//名称Frame
@property (nonatomic , assign, readonly) CGRect nameFrame;

//图片Frame
@property (nonatomic , assign, readonly) CGRect pictureFrame;

//内容Frame
@property (nonatomic , assign, readonly) CGRect textFrame;

//VIP图片Frame
@property (nonatomic , assign, readonly) CGRect vipFrame;

//微博cell的行高
@property (nonatomic , assign, readonly) CGFloat rowHeight;

@end

//
//  SYweibo.h
//  微博练习
//
//  Created by 123 on 16/8/31.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <Foundation/Foundation.h>

//微博内容的数据模型
@interface SYweibo : NSObject

//文字内容
@property (nonatomic , copy) NSString *text;

//用户头像
@property (nonatomic , copy) NSString *icon;

//内容图片
@property (nonatomic , copy) NSString *picture;

//用户名称
@property (nonatomic , copy) NSString *name;

//是否是微博VIP
@property (nonatomic , assign, getter=isVip) BOOL vip;

- (instancetype) initWithDic:(NSDictionary *) dic;

+ (instancetype) weiboWithDic:(NSDictionary *) dic;

+ (NSArray *) weiboList;

@end

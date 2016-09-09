//
//  CZFriend.h
//  A03-QQ好友列表
//
//  Created by Apple on 14/12/22.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZFriend : NSObject
/**
 *  头像
 */
@property (nonatomic,copy) NSString *icon;
/**
 *  个性签名
 */
@property (nonatomic,copy) NSString *intro;
/**
 *  好友名称
 */
@property (nonatomic,copy) NSString *name;
/**
 *  是否是会员
 */
@property (nonatomic,assign,getter=isVip) BOOL vip;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)friendWithDic:(NSDictionary *)dic;


@end

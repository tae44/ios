//
//  CZFriend.m
//  A03-QQ好友列表
//
//  Created by Apple on 14/12/22.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "CZFriend.h"

@implementation CZFriend
- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}


+ (instancetype)friendWithDic:(NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
}

@end

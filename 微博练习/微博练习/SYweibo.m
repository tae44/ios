//
//  SYweibo.m
//  微博练习
//
//  Created by 123 on 16/8/31.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYweibo.h"

@implementation SYweibo

- (instancetype) initWithDic:(NSDictionary *) dic {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype) weiboWithDic:(NSDictionary *) dic {
    return [[self alloc] initWithDic:dic];
}

+ (NSArray *) weiboList {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"microblog" ofType:@"plist"];
    NSArray *dicArray = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *tmpArray = [NSMutableArray array];
    for (NSDictionary *dic in dicArray) {
        SYweibo *weibo = [SYweibo weiboWithDic:dic];
        [tmpArray addObject:weibo];
    }
    return tmpArray;
}

@end

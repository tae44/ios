//
//  Flag.m
//  02.国旗选择
//
//  Created by Apple on 14/12/26.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "Flag.h"

@implementation Flag

- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype)flagWithDic:(NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
}

+ (NSArray *)flagList
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"flags" ofType:@"plist"];
    NSArray *dicArray = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *tmpArray = [NSMutableArray array];
    for (NSDictionary *dic in dicArray) {
        Flag *flag = [Flag flagWithDic:dic];
        [tmpArray addObject:flag];
    }
    return tmpArray;
}

@end

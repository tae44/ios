//
//  CZAppInfo.m
//  B02-应用管理
//
//  Created by Apple on 14/12/22.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "CZAppInfo.h"

@implementation CZAppInfo
- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}


+ (instancetype)appInfoWithDic:(NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
}

+ (NSArray *)appInfosList
{
    //加载plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"apps_full" ofType:@"plist"];
    NSArray *dicArray = [NSArray arrayWithContentsOfFile:path];
    
    //字典转模型
    NSMutableArray *tmpArray = [NSMutableArray array];
    for (NSDictionary *dic in dicArray) {
        CZAppInfo *appInfo = [CZAppInfo appInfoWithDic:dic];
        [tmpArray addObject:appInfo];
    }
    return tmpArray;
}
@end

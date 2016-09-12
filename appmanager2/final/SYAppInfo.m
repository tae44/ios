//
//  SYAppInfo.m
//  final
//
//  Created by 123 on 16/8/23.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYAppInfo.h"

@implementation SYAppInfo

- (instancetype) initWithDic:(NSDictionary *) dic {
    if (self = [super init]) {
        self.name = dic[@"name"];
        self.icon = dic[@"icon"];
    }
    return self;
}

+ (instancetype) appInfoWithDic:(NSDictionary *) dic {
    return [[self alloc] initWithDic:dic];
}

+ (NSArray *) appInfosList {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"app" ofType:@"plist"];
    NSArray *dicArray = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *tmpArray = [NSMutableArray array];
    for (NSDictionary *dic in dicArray) {
        SYAppInfo *appInfo = [SYAppInfo appInfoWithDic:dic];
        [tmpArray addObject:appInfo];
    }
    return tmpArray;
}

@end

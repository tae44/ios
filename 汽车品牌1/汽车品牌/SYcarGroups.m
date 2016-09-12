//
//  SYcarGroups.m
//  汽车品牌
//
//  Created by 123 on 16/8/29.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYcarGroups.h"

@implementation SYcarGroups

- (instancetype) initWithDic:(NSDictionary *) dic {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype) carGroupsWithDic:(NSDictionary *) dic {
    return [[self alloc] initWithDic:dic];
}

+ (NSArray *) carGroupsList {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"cars_simple" ofType:@"plist"];
    NSArray *dicArray = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *tmpArray = [NSMutableArray array];
    for (NSDictionary *dic in dicArray) {
        SYcarGroups *carGroups = [SYcarGroups carGroupsWithDic:dic];
        [tmpArray addObject:carGroups];
    }
    return tmpArray;
}

@end

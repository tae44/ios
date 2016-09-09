//
//  SYData.m
//  点选图片练习
//
//  Created by 123 on 16/9/6.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYData.h"

@implementation SYData

- (instancetype) initWithDic:(NSDictionary *) dic {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype) dataWithDic:(NSDictionary *) dic {
    return [[self alloc] initWithDic:dic];
}

+ (NSMutableArray *) dataList {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"plist"];
    NSArray *dicArray = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *tmpArray = [NSMutableArray array];
    for (NSDictionary *dic in dicArray) {
        SYData *data = [SYData dataWithDic:dic];
        [tmpArray addObject:data];
    }
    return tmpArray;
}

@end

//
//  SYItems.m
//  团购练习
//
//  Created by 123 on 16/8/30.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYItems.h"

@implementation SYItems

- (instancetype) initWithDic:(NSDictionary *) dic {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype) itemsWithDic:(NSDictionary *) dic {
    return [[self alloc] initWithDic:dic];
}

+ (NSMutableArray *) itemsList {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"tgs" ofType:@"plist"];
    NSArray *dicArray = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *tmpArray = [NSMutableArray array];
    for (NSDictionary *dic in dicArray) {
        SYItems *items = [SYItems itemsWithDic:dic];
        [tmpArray addObject:items];
    }
    return tmpArray;
}

@end

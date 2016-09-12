//
//  SYHeros.m
//  LOL
//
//  Created by 123 on 16/8/29.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYHeros.h"

@implementation SYHeros

- (instancetype) initWithDic:(NSDictionary *) dic {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype) herosWithDic:(NSDictionary *) dic {
    return [[self alloc] initWithDic:dic];
}

+ (NSArray *) heroList {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"heros" ofType:@"plist"];
    NSArray *dicArray = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *tmpArray = [NSMutableArray array];
    for (NSDictionary *dic in dicArray) {
        SYHeros *heros = [SYHeros herosWithDic:dic];
        [tmpArray addObject:heros];
    }
    return tmpArray;
}

@end

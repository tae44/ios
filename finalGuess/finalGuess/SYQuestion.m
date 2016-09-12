//
//  SYQuestion.m
//  finalGuess
//
//  Created by 123 on 16/8/25.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYQuestion.h"

@implementation SYQuestion

- (instancetype) initWithDic:(NSDictionary *) dic {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype) questionWithDic:(NSDictionary *) dic {
    return [[self alloc] initWithDic:dic];
}

+ (NSArray *) questionsList {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"questions" ofType:@"plist"];
    NSArray *dicArray = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *tmpArray = [NSMutableArray array];
    for (NSDictionary *dic in dicArray) {
        SYQuestion *question = [SYQuestion questionWithDic:dic];
        [tmpArray addObject:question];
    }
    return tmpArray;
}

@end

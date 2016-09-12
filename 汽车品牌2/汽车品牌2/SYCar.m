//
//  SYCar.m
//  汽车品牌2
//
//  Created by 123 on 16/8/29.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYCar.h"

@implementation SYCar

- (instancetype) initWithDic:(NSDictionary *) dic {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype) carWithDic:(NSDictionary *) dic {
    return [[self alloc] initWithDic:dic];
}

@end

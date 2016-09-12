//
//  SYCarGroups.m
//  汽车品牌2
//
//  Created by 123 on 16/8/29.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYCarGroups.h"
#import "SYCar.h"

@implementation SYCarGroups

- (instancetype) initWithDic:(NSDictionary *) dic {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype) carGroupsWithDic:(NSDictionary *) dic {
    return [[self alloc] initWithDic:dic];
}

+ (NSArray *) carList {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"cars_total" ofType:@"plist"];
    NSArray *dicArray = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *tmpArray = [NSMutableArray array];
    for (NSDictionary *dic in dicArray) {
        SYCarGroups *cars = [SYCarGroups carGroupsWithDic:dic];
        
        NSMutableArray *tmpCarArray = [NSMutableArray array];
        for (NSDictionary *tmpCar in cars.cars) {
            SYCar *car = [SYCar carWithDic:tmpCar];
            [tmpCarArray addObject:car];
        }
        cars.cars = tmpCarArray;
        [tmpArray addObject:cars];
    }
    return tmpArray;
}

@end

//
//  Province.m
//  03.省市联动
//
//  Created by Yong Feng Guo on 14-12-19.
//  Copyright (c) 2014年 Fung. All rights reserved.
//

#import "Province.h"

@implementation Province

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)provinceWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}

+(NSArray *)provinceList{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"provinces.plist" ofType:nil];
    NSArray *provincePlist = [NSArray arrayWithContentsOfFile:filePath];
    NSMutableArray *provinceM = [NSMutableArray array];
    for (NSDictionary *dic in provincePlist) {
        Province *prov = [Province provinceWithDict:dic];
        [provinceM addObject:prov];
    }
    return provinceM;
}
@end

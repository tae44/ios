//
//  SYProduct.m
//  彩票
//
//  Created by jason on 2016/10/11.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYProduct.h"

@implementation SYProduct

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        self.title = dict[@"title"];
        self.icon = dict[@"icon"];
    }
    return self;
}

+ (instancetype)productWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end

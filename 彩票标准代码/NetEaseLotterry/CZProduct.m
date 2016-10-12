//
//  CZProduct.m
//  NetEaseLotterry
//
//  Created by Vincent_Guo on 14-9-3.
//  Copyright (c) 2014年 vgios. All rights reserved.
//

#import "CZProduct.h"

@implementation CZProduct


-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        self.icon = dict[@"icon"];
        self.title = dict[@"title"];
        self.identifier = dict[@"id"];
        self.schemes = dict[@"customUrl"];
        self.appUrl = dict[@"url"];
    }
    
    return self;
}
+(instancetype)productWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}


@end

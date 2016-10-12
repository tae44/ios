//
//  SYHtmlPage.m
//  彩票
//
//  Created by jason on 2016/10/10.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYHtmlPage.h"

@implementation SYHtmlPage

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        self.html = dict[@"html"];
        self.title = dict[@"title"];
        self.ID = dict[@"id"];
    }
    return self;
}

+ (instancetype)htmlPageWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end

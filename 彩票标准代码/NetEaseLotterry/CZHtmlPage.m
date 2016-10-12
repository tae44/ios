//
//  CZHtml.m
//  NetEaseLotterry
//
//  Created by Vincent_Guo on 14-9-4.
//  Copyright (c) 2014年 vgios. All rights reserved.
//

#import "CZHtmlPage.h"

@implementation CZHtmlPage
-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        self.html = dict[@"html"];
        self.title = dict[@"title"];
        self.ID = dict[@"id"];
    }
    return self;
}


+(instancetype)htmlPageWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}
@end

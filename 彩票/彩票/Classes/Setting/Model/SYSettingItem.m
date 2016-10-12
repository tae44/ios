//
//  SYSettingItem.m
//  彩票
//
//  Created by jason on 2016/10/9.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYSettingItem.h"

@implementation SYSettingItem

- (instancetype)initWithIcon:(NSString *)icon title:(NSString *)title {
    if (self = [super init]) {
        self.icon = icon;
        self.title = title;
    }
    return self;
}

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title {
    return [[self alloc] initWithIcon:icon title:title];
}

+ (instancetype)itemWithIcon:(NSString *)icon title:(NSString *)title vcClass:(Class)vcClass {
    SYSettingItem *item = [self itemWithIcon:icon title:title];
    item.vcClass = vcClass;
    return item;
}

@end

//
//  CZSettingItem.m
//  NetEaseLotterry
//
//  Created by Vincent_Guo on 14-9-2.
//  Copyright (c) 2014年 vgios. All rights reserved.
//

#import "CZSettingItem.h"

@implementation CZSettingItem

+(instancetype)settingItemWithIcon:(NSString *)icon title:(NSString *)title vcClass:(__unsafe_unretained Class)vcClass{
    CZSettingItem *item = [[self alloc] init];
    item.icon = icon;
    item.title = title;
    item.vcClass = vcClass;
    return item;
}


+(instancetype)settingItemWithIcon:(NSString *)icon title:(NSString *)title{
    return [self settingItemWithIcon:icon title:title vcClass:nil];
}

+(instancetype)settingItemWithTitle:(NSString *)title{
        return [self settingItemWithIcon:nil title:title vcClass:nil];
}


@end

//
//  Flag.h
//  02.国旗选择
//
//  Created by Apple on 14/12/26.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Flag : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *icon;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)flagWithDic:(NSDictionary *)dic;

+ (NSArray *)flagList;

@end

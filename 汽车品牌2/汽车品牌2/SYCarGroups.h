//
//  SYCarGroups.h
//  汽车品牌2
//
//  Created by 123 on 16/8/29.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SYCarGroups : NSObject

@property (nonatomic , strong) NSArray *cars;

@property (nonatomic , copy) NSString *title;

- (instancetype) initWithDic:(NSDictionary *) dic;

+ (instancetype) carGroupsWithDic:(NSDictionary *) dic;

+ (NSArray *) carList;

@end

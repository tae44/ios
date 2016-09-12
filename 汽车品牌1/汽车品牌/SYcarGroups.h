//
//  SYcarGroups.h
//  汽车品牌
//
//  Created by 123 on 16/8/29.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SYcarGroups : NSObject

@property (nonatomic , copy) NSString *title;

@property (nonatomic , copy) NSString *desc;

@property (nonatomic , strong) NSArray *cars;

- (instancetype) initWithDic:(NSDictionary *) dic;

+ (instancetype) carGroupsWithDic:(NSDictionary *) dic;

+ (NSArray *) carGroupsList;

@end

//
//  SYItems.h
//  团购练习
//
//  Created by 123 on 16/8/30.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SYItems : NSObject

@property (nonatomic , copy) NSString *buyCount;

@property (nonatomic , copy) NSString *icon;

@property (nonatomic , copy) NSString *price;

@property (nonatomic , copy) NSString *title;

- (instancetype) initWithDic:(NSDictionary *) dic;

+ (instancetype) itemsWithDic:(NSDictionary *) dic;

+ (NSArray *) itemsList;

@end

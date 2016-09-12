//
//  SYHeros.h
//  LOL
//
//  Created by 123 on 16/8/29.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SYHeros : NSObject

@property (nonatomic , copy) NSString *name;

@property (nonatomic , copy) NSString *icon;

@property (nonatomic , copy) NSString *intro;

- (instancetype) initWithDic:(NSDictionary *) dic;

+ (instancetype) herosWithDic:(NSDictionary *) dic;

+ (NSArray *) heroList;

@end

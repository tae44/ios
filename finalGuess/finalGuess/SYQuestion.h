//
//  SYQuestion.h
//  finalGuess
//
//  Created by 123 on 16/8/25.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SYQuestion : NSObject

@property (nonatomic , copy) NSString *answer;

@property (nonatomic , copy) NSString *icon;

@property (nonatomic , copy) NSString *title;

@property (nonatomic , strong) NSArray *options;

@property (nonatomic , strong) NSArray *questions;

- (instancetype) initWithDic:(NSDictionary *) dic;

+ (instancetype) questionWithDic:(NSDictionary *) dic;

+ (NSArray *) questionsList;

@end

//
//  SYCar.h
//  汽车品牌2
//
//  Created by 123 on 16/8/29.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SYCar : NSObject

@property (nonatomic , copy) NSString *name;

@property (nonatomic , copy) NSString *icon;

- (instancetype) initWithDic:(NSDictionary *) dic;

+ (instancetype) carWithDic:(NSDictionary *) dic;

@end

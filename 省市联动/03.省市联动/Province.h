//
//  Province.h
//  03.省市联动
//
//  Created by Yong Feng Guo on 14-12-19.
//  Copyright (c) 2014年 Fung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Province : NSObject

@property(nonatomic,copy)NSString *name;
@property(nonatomic,strong)NSArray *cities;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)provinceWithDict:(NSDictionary *)dict;

+(NSArray *)provinceList;

@end

//
//  CZProduct.h
//  NetEaseLotterry
//
//  Created by Vincent_Guo on 14-9-3.
//  Copyright (c) 2014年 vgios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZProduct : NSObject

@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *identifier;
@property(nonatomic,copy)NSString *schemes;
@property(nonatomic,copy)NSString *appUrl;


-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)productWithDict:(NSDictionary *)dict;

@end

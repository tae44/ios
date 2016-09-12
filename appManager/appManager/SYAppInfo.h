//
//  SYAppInfo.h
//  appManager
//
//  Created by 123 on 16/8/22.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SYAppInfo : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *icon;

- (instancetype) initWithDic:(NSDictionary *) dic;

+ (instancetype) appInfoWithDic:(NSDictionary *) dic;

+ (NSArray *) appInfosList;

@end

//
//  SYData.h
//  点选图片练习
//
//  Created by 123 on 16/9/6.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SYData : NSObject

@property (nonatomic , copy) NSString *titileName;

@property (nonatomic , copy) NSString *imageName;

- (instancetype) initWithDic:(NSDictionary *) dic;

+ (instancetype) dataWithDic:(NSDictionary *) dic;

+ (NSMutableArray *) dataList;

@end

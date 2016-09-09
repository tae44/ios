//
//  CZFriendGroup.h
//  A03-QQ好友列表
//
//  Created by Apple on 14/12/22.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZFriendGroup : NSObject
/**
 *  分组名称
 */
@property (nonatomic,copy) NSString *name;
/**
 *  在线的
 */
@property (nonatomic,assign) int online;

//记录展开还是合并 默认NO  合并
@property (nonatomic,assign,getter=isExpend) BOOL expend;

@property (nonatomic,strong) NSArray *friends;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)friendGroupWithDic:(NSDictionary *)dic;

+ (NSArray *)friendGroupsList;
@end

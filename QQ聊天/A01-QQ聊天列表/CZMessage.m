//
//  CZMessage.m
//  A01-QQ聊天列表
//
//  Created by Apple on 14/12/21.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "CZMessage.h"

@implementation CZMessage
- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
+ (instancetype)messageWithDic:(NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
}
+ (NSArray *)messagesList
{
    //读取plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"messages" ofType:@"plist"];
    NSArray *dicArray = [NSArray arrayWithContentsOfFile:path];
    //字典转模型
    NSMutableArray *tmpArray = [NSMutableArray array];
    //上一条消息
    CZMessage *preMessage;
    for (NSDictionary *dic in dicArray) {
        CZMessage *message = [CZMessage messageWithDic:dic];
        //获取上一条消息
        //preMessage = [tmpArray lastObject];
        if ([message.time isEqualToString:preMessage.time]) {
            //时间相等 隐藏
            message.hiddenTime = YES;
        }
        [tmpArray addObject:message];
        //获取上一条消息
        preMessage = message;
    }
    return tmpArray;
}
@end

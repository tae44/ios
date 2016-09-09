//
//  CZFriendGroup.m
//  A03-QQ好友列表
//
//  Created by Apple on 14/12/22.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "CZFriendGroup.h"
#import "CZFriend.h"
@implementation CZFriendGroup
- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}


+ (instancetype)friendGroupWithDic:(NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
}

+ (NSArray *)friendGroupsList
{
    //加载plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"friends" ofType:@"plist"];
    NSArray *dicArray = [NSArray arrayWithContentsOfFile:path];
    
    //字典转模型
    NSMutableArray *tmpArray = [NSMutableArray array];
    for (NSDictionary *dic in dicArray) {
        CZFriendGroup *friendGroup = [CZFriendGroup friendGroupWithDic:dic];
        //字典转模型
        NSMutableArray *tmpFriendsArray = [NSMutableArray array];
        for (NSDictionary *friendDic in friendGroup.friends) {
            CZFriend *friend = [CZFriend friendWithDic:friendDic];
            [tmpFriendsArray addObject:friend];
        }
        friendGroup.friends = tmpFriendsArray;
        
        [tmpArray addObject:friendGroup];
    }
    return tmpArray;
}
@end

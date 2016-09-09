//
//  CZFriendCell.h
//  A03-QQ好友列表
//
//  Created by Apple on 14/12/22.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CZFriend;

@interface CZFriendCell : UITableViewCell

@property (nonatomic,strong) CZFriend *friendData;

+ (instancetype)friendCellWithTableView:(UITableView *)tableView;
@end

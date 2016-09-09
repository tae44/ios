//
//  CZFriendGroupHeaderView.h
//  A03-QQ好友列表
//
//  Created by Apple on 14/12/22.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CZFriendGroup,CZFriendGroupHeaderView;
//1 定义代理协议
@protocol CZFriendGroupHeaderViewDelegate <NSObject>

@optional
- (void)headerViewDidClickedNameBtn:(CZFriendGroupHeaderView *)headerView;

@end


@interface CZFriendGroupHeaderView : UITableViewHeaderFooterView
@property (nonatomic,strong) CZFriendGroup *friendGroup;
//2 定义代理属性
@property (nonatomic,weak) id<CZFriendGroupHeaderViewDelegate> delegate;

+ (instancetype)headerViewWithTableView:(UITableView *)tableView;
@end

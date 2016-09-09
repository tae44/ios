//
//  CZFriendCell.m
//  A03-QQ好友列表
//
//  Created by Apple on 14/12/22.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "CZFriendCell.h"
#import "CZFriend.h"
@implementation CZFriendCell

+ (instancetype)friendCellWithTableView:(UITableView *)tableView
{
    static NSString *reuseId = @"friend";
    CZFriendCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (cell == nil) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseId];
    }
    return cell;
}

- (void)setFriendData:(CZFriend *)friendData
{
    _friendData = friendData;
    self.textLabel.text = friendData.name;
    self.detailTextLabel.text = friendData.intro;
    self.imageView.image = [UIImage imageNamed:friendData.icon];
    //会员
    self.textLabel.textColor = friendData.isVip ? [UIColor redColor] : [UIColor blackColor];
}
@end

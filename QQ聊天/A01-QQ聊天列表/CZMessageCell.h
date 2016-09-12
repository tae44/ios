//
//  CZMessageCell.h
//  A01-QQ聊天列表
//
//  Created by Apple on 14/12/21.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CZMessageFrame;
@interface CZMessageCell : UITableViewCell

@property (nonatomic,strong) CZMessageFrame *messageFrame;

+ (instancetype)messageCellWithTableView:(UITableView *)tableView;
@end

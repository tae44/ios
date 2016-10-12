//
//  SYSettingCell.h
//  彩票
//
//  Created by jason on 2016/10/9.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SYSettingItem;

@interface SYSettingCell : UITableViewCell
/**表格的数据模型*/
@property (nonatomic, strong) SYSettingItem *item;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end

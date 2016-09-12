//
//  SYItemCell.h
//  团购练习
//
//  Created by 123 on 16/8/30.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SYItems;

@interface SYItemCell : UITableViewCell

@property (nonatomic, strong) SYItems *items;

+ (instancetype)itemCellWithTableView:(UITableView *)tableView;

@end

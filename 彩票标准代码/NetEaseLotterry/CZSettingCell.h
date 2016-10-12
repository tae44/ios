//
//  CZSettingCell.h
//  NetEaseLotterry
//
//  Created by Vincent_Guo on 14-9-2.
//  Copyright (c) 2014年 vgios. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CZSettingItem;
@interface CZSettingCell : UITableViewCell


+(instancetype)settingCellWithTableView:(UITableView *)tableView;
@property(nonatomic,assign,getter = isLastRowInSection)BOOL lastRowInSection;

@property(nonatomic,strong)CZSettingItem  *item;
@end

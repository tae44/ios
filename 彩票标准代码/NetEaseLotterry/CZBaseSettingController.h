//
//  CZBaseSettingController.h
//  NetEaseLotterry
//
//  Created by Vincent_Guo on 14-9-4.
//  Copyright (c) 2014年 vgios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CZSettingSwitchItem.h"
#import "CZSettingArrowItem.h"
#import "CZSettingGroup.h"
#import "CZSettingLabelItem.h"

@interface CZBaseSettingController : UITableViewController
@property(nonatomic,strong)NSMutableArray *data;//设置的tableView数据

-(void)showAlertWithMsg:(NSString *)msg;
@end

//
//  CZAppInfoCell.h
//  B02-应用管理
//
//  Created by Apple on 14/12/22.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CZAppInfo,CZAppInfoCell;

//1 代理协议
@protocol CZAppInfoCellDelegate <NSObject>

@optional
- (void)appInfoCellDidClickedDownload:(CZAppInfoCell *)cell;

@end

@interface CZAppInfoCell : UITableViewCell
@property (nonatomic,strong) CZAppInfo *appInfo;

//2 代理属性
@property (nonatomic,weak) id<CZAppInfoCellDelegate> delegate;
@end

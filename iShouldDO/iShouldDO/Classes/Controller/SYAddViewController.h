//
//  SYAddViewController.h
//  iShouldDO
//
//  Created by jason on 2016/9/26.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SYAddViewController,SYMission;

// 设置代理协议
@protocol SYAddViewControllerDelegate <NSObject>

@optional
- (void)addViewDidClickedAddBtn:(SYAddViewController *)addView missionModel:(SYMission *)mission;

@end

@interface SYAddViewController : UIViewController
/**设置代理属性*/
@property (nonatomic, weak) id<SYAddViewControllerDelegate> delegate;

@end

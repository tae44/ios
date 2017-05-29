//
//  SYEditViewController.h
//  iShouldDO
//
//  Created by jason on 2016/9/27.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SYMission,SYEditViewController;

@protocol SYEditViewControllerDelegate <NSObject>

@optional
- (void)editViewDidClickedAddBtn:(SYEditViewController *)editView missionModel:(SYMission *)mission;

@end

@interface SYEditViewController : UIViewController

@property (nonatomic, strong) SYMission *mission;

@property (nonatomic, weak) id<SYEditViewControllerDelegate> delegate;

@end

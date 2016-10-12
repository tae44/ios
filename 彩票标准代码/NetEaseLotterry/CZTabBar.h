//
//  CZTabBar.h
//  NetEaseLotterry
//
//  Created by Vincent_Guo on 14-8-3.
//  Copyright (c) 2014年 vgios. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CZTabBar;
@protocol CZTabBarDelegate <NSObject>

-(void)tabBar:(CZTabBar *)tabBar didSelectBtnFrom:(int)from to:(int)to;

@end

@interface CZTabBar : UIView

@property(nonatomic,weak)id<CZTabBarDelegate> delegate;

-(void)addTabBarButtonWithNormalBg:(NSString *)normalBg selBg:(NSString *)selBg;

@end

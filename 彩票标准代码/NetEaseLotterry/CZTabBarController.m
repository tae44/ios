//
//  CZTabBarController.m
//  NetEaseLotterry
//
//  Created by Vincent_Guo on 14-8-3.
//  Copyright (c) 2014年 vgios. All rights reserved.
//

#import "CZTabBarController.h"
#import "CZTabBar.h"
#import "CZTabBarButton.h"

@interface CZTabBarController ()<CZTabBarDelegate>
@end

@implementation CZTabBarController


- (void)viewDidLoad
{
    [super viewDidLoad];
    //1.移除或者隐藏系统的tabbar;
    //self.tabBar.hidden = YES;
    //[self.tabBar removeFromSuperview];
    
    //2.添加自己的TabBar
    CZTabBar *mTabBar = [[CZTabBar alloc] init];
    mTabBar.delegate = self;
    mTabBar.backgroundColor = [UIColor grayColor];
    
    //干掉tabbar导航不能隐藏tabBar
    //mTabBar.frame = self.tabBar.frame;
    //[self.view addSubview:mTabBar];
    
    //不干掉tabbar
    mTabBar.frame = self.tabBar.bounds;
    [self.tabBar addSubview:mTabBar];
    
    
    //添加五个按钮
    for (int i = 0; i < 5; i++) {
        NSString *normalBg = [NSString stringWithFormat:@"TabBar%d",i + 1];
        NSString *selectedBg = [NSString stringWithFormat:@"TabBar%dSel",i + 1];
        [mTabBar addTabBarButtonWithNormalBg:normalBg selBg:selectedBg];
    }
    
   
    
}


-(void)tabBar:(CZTabBar *)tabBar didSelectBtnFrom:(int)from to:(int)to{
    self.selectedIndex = to;
}
@end

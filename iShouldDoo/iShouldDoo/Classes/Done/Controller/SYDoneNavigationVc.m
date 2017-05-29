//
//  SYDoneNavigationVc.m
//  iShouldDoo
//
//  Created by jason on 2016/10/13.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYDoneNavigationVc.h"

@interface SYDoneNavigationVc ()

@end

@implementation SYDoneNavigationVc

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarItem.title = @"已完成";
    self.tabBarItem.image = [UIImage imageNamed:@"done-Small"];
}

@end

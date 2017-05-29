//
//  SYDeleteNavigationVc.m
//  iShouldDoo
//
//  Created by jason on 2016/10/13.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYDeleteNavigationVc.h"

@interface SYDeleteNavigationVc ()

@end

@implementation SYDeleteNavigationVc

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarItem.title = @"已删除";
    self.tabBarItem.image = [UIImage imageNamed:@"delete-Small"];
}

@end

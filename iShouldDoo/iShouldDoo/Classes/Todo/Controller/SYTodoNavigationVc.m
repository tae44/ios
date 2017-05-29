//
//  SYTodoNavigationVc.m
//  iShouldDoo
//
//  Created by jason on 2016/10/13.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYTodoNavigationVc.h"

@interface SYTodoNavigationVc ()

@end

@implementation SYTodoNavigationVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // 下面按钮的标题
    self.tabBarItem.title = @"未完成";
    // 按钮图片
    self.tabBarItem.image = [UIImage imageNamed:@"todo-Small"];
}

@end

//
//  SYTabBarController.m
//  彩票
//
//  Created by jason on 2016/9/29.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYTabBarController.h"
#import "SYTabbar.h"

@interface SYTabBarController () <SYTabbarDelegate>

@end

@implementation SYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 自定义tabbar
    SYTabbar *myTabbar = [[SYTabbar alloc] initWithFrame:self.tabBar.bounds];
    // 添加按钮
    for (NSInteger i = 0; i < 5; i++) {
        // 获取普通状态的图片名称
        NSString *normalImg = [NSString stringWithFormat:@"TabBar%ld", i+1];
        // 获取选中的图片
        NSString *selImg = [NSString stringWithFormat:@"TabBar%ldSel", i+1];
        [myTabbar addTabbarBtnWithNormalImg:normalImg selImg:selImg];
    }
    // 设置代理
    myTabbar.delegate = self;
    // 将自定义的tabbar添加到系统的tabbar上
    [self.tabBar addSubview:myTabbar];
}

#pragma mark - 自定义Tabbar的代理方法

- (void)tabbar:(SYTabbar *)tabbar didSelectedTo:(NSInteger)to {
    // 切换控制器的子控制器
    self.selectedIndex = to;
}

@end

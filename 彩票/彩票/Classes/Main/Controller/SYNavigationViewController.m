//
//  SYNavigationViewController.m
//  彩票
//
//  Created by jason on 2016/10/9.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYNavigationViewController.h"

@interface SYNavigationViewController ()

@end

@implementation SYNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置当前导航条背景
    // [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
}

/**
 类第一次使用的时候被调用
 */
+ (void)initialize {
    // 设置主题
    /**设置导航条的背景图片注意点
     * 1.在ios7以上,背景图片的高度一定要64(点)
     * 2.背景图片的宽度无限制,自动会拉伸
     * 3.如果是通过导航控制器获取的导航条来设置背景,它是局部
     *   self.navigationController.navigationBar
     * 4.如果想设置一次导航栏的背景,这个导航条的对象,通过导航条的一个类方法获取的就可以 [UINavigationBar appearance]
     */
    UINavigationBar *navBar = [UINavigationBar appearance];
    // 设置全局导航条背景
    [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    // UIApplication设置状态栏样式
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    // 设置导航条标题的字体和颜色
    NSDictionary *titleAttr = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:24]};
    [navBar setTitleTextAttributes:titleAttr];
    // 设置返回按钮样式
    // tintColor用于导航条的所有Item
    navBar.tintColor = [UIColor whiteColor];
    UIBarButtonItem *navItem = [UIBarButtonItem appearance];
    // 改变整个按钮背影
    // [navItem setBackButtonBackgroundImage:[UIImage imageNamed:@"NavBackButton"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    // 设置Item字体大小
    [navItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18]} forState:UIControlStateNormal];
}

#pragma mark - 设置状态栏的样式

// 如果有导航控制器的,状态栏的样式要在导航控制器里设置,不能在子控制器里设置,这种方式只能针对局部的控制器
//- (UIStatusBarStyle)preferredStatusBarStyle{
//    return UIStatusBarStyleLightContent;
//}

#pragma mark - 导航控制器的子控制器被pop的时候会调用

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    return [super popViewControllerAnimated:animated];
}

#pragma mark - 导航控制器的子控制器被push的时候会调用

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // push之后隐藏tabbar
    viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:animated];
}

@end

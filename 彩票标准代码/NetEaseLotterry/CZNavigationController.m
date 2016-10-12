//
//  CZNavigationController.m
//  NetEaseLotterry
//
//  Created by Vincent_Guo on 14-8-3.
//  Copyright (c) 2014年 vgios. All rights reserved.
//

#import "CZNavigationController.h"
#import "UIImage+CZ.h"

@interface CZNavigationController ()

@end

@implementation CZNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];

    //每个导航控制器的导航条是不同个对象
    //CZLog(@"%@", self.navigationBar);
    //[self.navigationBar setBackgroundImage:[UIImage imageNamed:@"tabbar_bg"] forBarMetrics:UIBarMetricsDefault];
    
}

//类被第一次调用时，一个类只会调用一次
+(void)initialize{
    //获取导航条
    UINavigationBar *navBar = [UINavigationBar appearance];
    NSString *navBg = @"NavBar";
    if(iOS7){
        navBg = @"NavBar64";
        navBar.tintColor = [UIColor whiteColor];
    }
    
    //设置导航栏背影
    [navBar setBackgroundImage:[UIImage imageNamed:navBg] forBarMetrics:UIBarMetricsDefault];
    
    
    //设置导航标题文字
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSForegroundColorAttributeName] = [UIColor whiteColor];
    attr[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    [navBar setTitleTextAttributes:attr];
    
    
    //设置导航栏UIBarButtomItem样式
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    //设置Item的字体大小与颜色
    NSDictionary *itmeAtt = @{
                               NSFontAttributeName: [UIFont systemFontOfSize:14],
                               NSForegroundColorAttributeName:[UIColor whiteColor]};
    [item setTitleTextAttributes:itmeAtt forState:UIControlStateNormal];
    if (!iOS7) {
        //设置导航栏Items的颜色
        //设置items
        
        [item setBackgroundImage:[UIImage imageNamed:@"NavButton"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [item setBackgroundImage:[UIImage imageNamed:@"NavButtonPressed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
        
        [item setBackButtonBackgroundImage:[UIImage imageNamed:@"NavBackButton"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        
        [item setBackButtonBackgroundImage:[UIImage imageNamed:@"NavBackButtonPressed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];

        
    }
    
}

//重写这个方法，拦截push所有操作
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    NSLog(@"pushViewController");
    viewController.hidesBottomBarWhenPushed = YES;
    [super pushViewController:viewController animated:YES];
}

//-(UIViewController *)popViewControllerAnimated:(BOOL)animated{
//    NSLog(@"popViewControllerAnimated");
//    return [super popViewControllerAnimated:NO];
//}
@end

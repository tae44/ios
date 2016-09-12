//
//  ViewController.m
//  06.UIApplication
//
//  Created by Apple on 14/12/26.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //设置网络请求状态
    
    UIApplication *app = [UIApplication sharedApplication];
    app.networkActivityIndicatorVisible = !app.networkActivityIndicatorVisible;
    
    //设置应用图标右上角数字
    
#warning ios8以后，设置icon的badge，需要权限
    app.applicationIconBadgeNumber = 10;
    
    
    //设置状态栏的样式
    /**
     1.在xcode5以后，创建的项目，状态栏的样式是同控制器管理
     2.如果想applcation对象能设置状态栏样式，要在info.plist添加View controller-based status bar appearance属性为NO
     */
    app.statusBarStyle = UIStatusBarStyleLightContent;
}

#pragma mark 状态栏样式
//-(UIStatusBarStyle)preferredStatusBarStyle{
//    return UIStatusBarStyleLightContent;
//}
@end

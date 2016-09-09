//
//  SYViewController.m
//  控制器的创建方式
//
//  Created by Jason on 16/9/9.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "SYViewController.h"

@interface SYViewController ()

@end

@implementation SYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

//再加载view,会调用这个方法
/**
 *  初始化控制器view
 */
//-(void)loadView{
//    //load方法会加载view
//    //[super loadView];
//    //自定义一些view
//    NSLog(@"%s",__func__);
//    self.view = [[UITableView alloc] init];
//    
//#warning self.view 实际访问一个view,如这个view不存在，它就会调用 loadview去加载控制器的view
//    self.view.backgroundColor = [UIColor grayColor];
//}

@end

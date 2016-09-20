//
//  ViewController.m
//  饼状图
//
//  Created by jason on 16/9/20.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"
#import "SYPieView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SYPieView *pieView = [[SYPieView alloc] init];
    pieView.frame = CGRectMake(10, 40, 200, 200);
    pieView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:pieView];
    
    pieView.sections = @[@20,@30,@40,@10];
    pieView.sectionColors = @[[UIColor redColor],[UIColor greenColor],[UIColor purpleColor],[UIColor yellowColor]];
}

@end

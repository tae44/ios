//
//  ViewController.m
//  转盘
//
//  Created by jason on 2016/10/11.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"
#import "SYWheel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    SYWheel *wheel = [[SYWheel alloc] initWithFrame:CGRectMake(0, 0, screenSize.width, screenSize.height)];
    self.view = wheel;
    self.view.backgroundColor = [UIColor whiteColor];
    [wheel start];
}

@end

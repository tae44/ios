//
//  SYContactsViewController.m
//  通讯录
//
//  Created by 123 on 16/9/13.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYContactsViewController.h"

@interface SYContactsViewController ()

@end

@implementation SYContactsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)logoutBtnClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end

//
//  SYLoginViewController.m
//  通讯录
//
//  Created by 123 on 16/9/13.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYLoginViewController.h"

@interface SYLoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *accountField;

@property (weak, nonatomic) IBOutlet UITextField *passwordField;

- (IBAction)loginBtnClick;

@end

@implementation SYLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)loginBtnClick {
    NSString *account = self.accountField.text;
    NSString *password = self.passwordField.text;
    if ([account isEqualToString:@"zhangsan"] && [password isEqualToString:@"123"]) {
        NSLog(@"账号与密码正确");
        //执行一个segue，就会进入segue所指的控制器,提前设置segue的ID值
        [self performSegueWithIdentifier:@"toContactsSegue" sender:nil];
    } else {
        NSLog(@"账号或密码不正确");
    }
}

/**
 *  使用segue跳转下一个界面之前会调用
 *
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"%s",__func__);
    NSLog(@"源控制器 %@",segue.sourceViewController);
    NSLog(@"目标控制器 %@",segue.destinationViewController);
}

@end

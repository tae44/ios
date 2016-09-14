//
//  SYLoginViewController.m
//  通讯录
//
//  Created by 123 on 16/9/13.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYLoginViewController.h"
#import "SYContactsViewController.h"
#import "MBProgressHUD.h"

@interface SYLoginViewController ()
/**账号输入框*/
@property (weak, nonatomic) IBOutlet UITextField *accountField;
/**密码输入框*/
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
/**登陆按钮*/
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

- (IBAction)loginBtnClick;
/**记住密码的开关*/
@property (weak, nonatomic) IBOutlet UISwitch *rememberPwdSwitch;
/**自动登陆的开关*/
@property (weak, nonatomic) IBOutlet UISwitch *autoLoginSwitch;

@end

@implementation SYLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    连线解决,输入变动的时候调用方法
//    [self.accountField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
//    [self.passwordField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
}

/**
 *  监测输入框为空时登陆按钮禁用
 */
- (IBAction)textChange {
    self.loginBtn.enabled = (self.accountField.text.length != 0 && self.passwordField.text.length != 0);
}

/**
 *  第三方框架的演示代码,制作提示框效果
 */
- (void)customViewExample {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    
    // Set the custom view mode to show any view.
    hud.mode = MBProgressHUDModeCustomView;
    // Set an image view with a checkmark.
    UIImage *image = [[UIImage imageNamed:@"Checkmark"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    hud.customView = [[UIImageView alloc] initWithImage:image];
    // Looks a bit nicer if we make it square.
    hud.square = YES;
    // Optional label text.
    hud.label.text = NSLocalizedString(@"用户名或密码错误", @"HUD done title");
    
    [hud hideAnimated:YES afterDelay:1.5];
}

- (IBAction)loginBtnClick {
    NSString *account = self.accountField.text;
    NSString *password = self.passwordField.text;
    if ([account isEqualToString:@"zhangsan"] && [password isEqualToString:@"123"]) {
        //使用第三方框架制作提示框效果
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
        hud.label.text = NSLocalizedString(@"登录中...", @"HUD loading title");
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
            sleep(1.5);
            //执行一个segue，就会进入segue所指的控制器,提前设置segue的ID值
            [self performSegueWithIdentifier:@"toContactsSegue" sender:nil];
            dispatch_async(dispatch_get_main_queue(), ^{
                [hud hideAnimated:YES];
            });
        });
    } else {
        [self customViewExample];
    }
}

/**
 *  记录密码开关的值变化
 */
- (IBAction)rememberPwdSwitchChange {
    //如果记住密码为关闭状态 并且 自动登录为开启的状态，此时自动登录应改为关闭
    if (self.rememberPwdSwitch.isOn == NO && self.autoLoginSwitch.isOn == YES) {
        [self.autoLoginSwitch setOn:NO animated:YES];
    }
}

/**
 *  自动登录开关的值变化
 */
- (IBAction)autoLoginSwitchChange {
    //如果自动登录为开启状态 并且 记住密码为关闭状态，些时记住密码应改为开启
    if (self.autoLoginSwitch.isOn == YES && self.rememberPwdSwitch.isOn == NO) {
        [self.rememberPwdSwitch setOn:YES animated:YES];
    }
}

/**
 *  使用segue跳转下一个界面之前会调用
 *
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    NSLog(@"%s",__func__);
//    NSLog(@"源控制器 %@",segue.sourceViewController);
//    NSLog(@"目标控制器 %@",segue.destinationViewController);
    //可以传递数据给下一个控制器
    id destVc = segue.destinationViewController;
    if ([destVc isKindOfClass:[SYContactsViewController class]]) {
        SYContactsViewController *contactsVc = destVc;
        contactsVc.name = self.accountField.text;
    }
}

@end

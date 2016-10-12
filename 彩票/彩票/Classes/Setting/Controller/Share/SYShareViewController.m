//
//  SYShareViewController.m
//  彩票
//
//  Created by jason on 2016/10/11.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYShareViewController.h"
#import <MessageUI/MessageUI.h>
#import "SYSettingItem.h"
#import "SYSettingArrowItem.h"
#import "SYSettingGroup.h"

@interface SYShareViewController () <MFMessageComposeViewControllerDelegate,MFMailComposeViewControllerDelegate>

@end

@implementation SYShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始化数据
    SYSettingItem *item1 = [SYSettingArrowItem itemWithIcon:@"MailShare" title:@"新浪微博"];
    SYSettingItem *item2 = [SYSettingArrowItem itemWithIcon:@"MailShare" title:@"短信分享"];
    // 弱引用
    __weak SYShareViewController *selfVc = self;
    // 弱引用避免下面block的循环引用
    item2.operation = ^{
        // 此种方式不能设置短信内容
        // [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"sms://10086"] options:nil completionHandler:nil];
        // 判断能否发送短信
        if ([MFMessageComposeViewController canSendText]) {
            // 如果要设置短信内容,使用MessageUI
            // 创建MFMessageComposeViewController
            MFMessageComposeViewController *msgVc = [[MFMessageComposeViewController alloc] init];
            // 设置电话
            msgVc.recipients = @[@"10086", @"10010"];
            // 设置内容
            msgVc.body = @"恭喜你中奖!";
            // 设置代理
            msgVc.messageComposeDelegate = selfVc;
            // 显示信息界面
            [selfVc presentViewController:msgVc animated:YES completion:nil];
        }
    };
    SYSettingItem *item3 = [SYSettingArrowItem itemWithIcon:@"MailShare" title:@"邮件分享"];
    item3.operation = ^{
        // 此种方式不能设置内容
        // [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto://123@qq.com"] options:nil completionHandler:nil];
        // 判断是否能发送邮件
        if ([MFMailComposeViewController canSendMail]) {
            // 创建MFMailComposeViewControler
            MFMailComposeViewController *mailVc = [[MFMailComposeViewController alloc] init];
            // 设置接收人
            [mailVc setToRecipients:@[@"123@qq.com", @"456@qq.com"]];
            // 抄送
            [mailVc setCcRecipients:@[@"123@qq.com", @"456@qq.com"]];
            // 密送
            [mailVc setBccRecipients:@[@"123@qq.com", @"456@qq.com"]];
            // 设置内容
            [mailVc setMessageBody:@"恭喜你中奖!" isHTML:NO];
            // 设置代理
            mailVc.mailComposeDelegate = selfVc;
            [selfVc presentViewController:mailVc animated:YES completion:nil];
        }
    };
    SYSettingGroup *group = [[SYSettingGroup alloc] init];
    group.items = @[item1, item2, item3];
    [self.cellData addObject:group];
}

#pragma mark - 信息的代理方法

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
    if (result == MessageComposeResultCancelled || result == MessageComposeResultSent) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

#pragma mark - 邮件的代理方法

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

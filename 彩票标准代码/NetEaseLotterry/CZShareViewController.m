//
//  CZShareViewController.m
//  NetEaseLotterry
//
//  Created by Vincent_Guo on 14-9-6.
//  Copyright (c) 2014年 vgios. All rights reserved.
//

#import "CZShareViewController.h"
#import <MessageUI/MessageUI.h>

@interface CZShareViewController ()<MFMessageComposeViewControllerDelegate,UINavigationControllerDelegate,MFMailComposeViewControllerDelegate>
@property(nonatomic,assign)int age;
@end

@implementation CZShareViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CZSettingArrowItem *item1 = [CZSettingArrowItem settingItemWithIcon:@"WeiboSina" title:@"新浪微博"];
    
   
    CZSettingArrowItem *item2 = [CZSettingArrowItem settingItemWithIcon:@"SmsShare" title:@"短信分享"];
    
    //__unsafe_unretained CZShareViewController *shareVc = self;
    //__weak CZShareViewController *shareVc = self;
    // __unsafe_unretained
   typeof(self) selfVc = self;
    item2.option = ^{
        //1.
//        NSURL *smsUrl = [NSURL URLWithString:@"sms://1008611"];
//        [[UIApplication sharedApplication] openURL:smsUrl];
        
        //2
        selfVc -> _age = 10;
        MFMessageComposeViewController *msgVc = [[MFMessageComposeViewController alloc] init];
        if(![MFMessageComposeViewController canSendText]) return ;
        
        //设置接收的电话号码
        msgVc.recipients = @[@"10086",@"10010"];
        
        msgVc.body = @"how are you";
        msgVc.messageComposeDelegate = selfVc;
        
        [selfVc presentViewController:msgVc animated:YES completion:nil];
    };
    
    CZSettingArrowItem *item3 = [CZSettingArrowItem settingItemWithIcon:@"MailShare" title:@"邮件分享"];
    
    item3.option = ^{
        
        //方法1
//        NSURL *mailUrl = [NSURL URLWithString:@"mailto://1030103135@qq.com"];
//        [[UIApplication sharedApplication] openURL:mailUrl];
        
        MFMailComposeViewController *mailVc = [[MFMailComposeViewController alloc] init];
        
        mailVc.mailComposeDelegate = selfVc;
        
        [mailVc setSubject:@"subxxxx"];
        [mailVc setToRecipients:@[@"1030103135@qq.com"]];
        [mailVc setCcRecipients:@[@"zhangsan@qq.com",@"lisi@qq.com"]];
        [mailVc setBccRecipients:@[@"103010313@qq.com"]];
        [mailVc setMessageBody:@"HOW ARE YOU" isHTML:NO];
        
        UIImage *image = [UIImage imageNamed:@"tabbar_bg"];
        [mailVc addAttachmentData:UIImageJPEGRepresentation(image, 0.7) mimeType:@"image/jpeg" fileName:@"tabbar_bg.jpg"];
        
        [selfVc presentViewController:mailVc animated:YES completion:nil];
    };
    
    
    CZSettingGroup *group = [[CZSettingGroup alloc] init];
    group.items = @[item1,item2,item3];
    
    [self.data addObject:group];
}


-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    CZLog(@"===");
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    CZLog(@"===");
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)dealloc{
    CZSettingGroup *group = self.data[0];
    for (CZSettingItem *item in group.items) {
        item.option = nil;
    }
    CZLog(@"===");
    
    
}
@end

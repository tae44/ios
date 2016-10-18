//
//  SessionViewController.m
//  微信
//
//  Created by jason on 2016/10/18.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SessionViewController.h"

@interface SessionViewController ()

@end

@implementation SessionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

/**
 返回到跳转过来的APP
 */
- (IBAction)backToNews {
    NSRange range = [self.appURLStr rangeOfString:@"?"];
    NSString *appStr = [self.appURLStr substringFromIndex:range.location + 1];
    NSString *appURL = [NSString stringWithFormat:@"%@://", appStr];
    NSURL *url = [NSURL URLWithString:appURL];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url options:nil completionHandler:nil];
    }
}

@end

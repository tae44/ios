//
//  CZAboutViewController.m
//  NetEaseLotterry
//
//  Created by Vincent_Guo on 14-9-6.
//  Copyright (c) 2014年 vgios. All rights reserved.
//

#import "CZAboutViewController.h"
#import "CZAboutHeaderView.h"

@interface CZAboutViewController ()

@property(nonatomic,strong)UIWebView *mWebView;

@end

@implementation CZAboutViewController

/**
 *  供打电话用的webview
 */
-(UIWebView *)mWebView{
    if (_mWebView == nil) {
        _mWebView = [[UIWebView alloc] initWithFrame:CGRectZero];
    }
    return _mWebView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CZSettingArrowItem *item1 = [CZSettingArrowItem settingItemWithTitle:@"评分支持"];
    item1.option = ^{
        NSString *appid = @"725296055";
        NSString *str = [NSString stringWithFormat:
                         @"itms-apps://itunes.apple.com/cn/app/id%@?mt=8", appid];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];

    };
    
    
    
    CZSettingArrowItem *item2 = [CZSettingArrowItem settingItemWithTitle:@"客户电话"];
    
    
    item2.option = ^{
        //1.
        NSURL *telUrl1 = [NSURL URLWithString:@"tel://10086"];
        
        //2
//        NSURL *telUrl2 = [NSURL URLWithString:@"telprompt://10086"];
//        if (![[UIApplication sharedApplication] canOpenURL:telUrl2]) {
//            [self showAlertWithMsg:@"你的设备不支持打电话"];
//        }
        
        //3
        [self.mWebView loadRequest:[NSURLRequest requestWithURL:telUrl1]];
        
    };
    
    
    item2.subTitle = @"10086";
    CZSettingGroup *group = [[CZSettingGroup alloc] init];
    group.items = @[item1,item2];
    
    [self.data addObject:group];
    
    
    self.tableView.tableHeaderView = [CZAboutHeaderView aboutHeaderView];

}




@end

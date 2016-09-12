//
//  ViewController.m
//  appManager
//
//  Created by 123 on 16/8/22.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"
#import "SYAppInfo.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *appInfos;

@end

@implementation ViewController

- (NSArray *) appInfos {
    if (_appInfos == nil) {
        _appInfos = [SYAppInfo appInfosList];
    }
    return _appInfos;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat subViewWidth = 100;
    CGFloat subViewHeight = 100;
    CGFloat marginX = (self.view.frame.size.width - 3 * subViewWidth) / 4;
    CGFloat marginY = 20;
    
    for (int i = 0; i < self.appInfos.count; i++) {
        UIView *subView = [[[NSBundle mainBundle] loadNibNamed:@"SYAppInfoView" owner:nil options:nil] lastObject];
        [self.view addSubview:subView];
        int row = i / 3;
        int column = i % 3;
        CGFloat subViewX = marginX + column * (marginX + subViewWidth);
        CGFloat subViewY = 30 + row * (marginY + subViewHeight);
        subView.frame = CGRectMake(subViewX, subViewY, subViewWidth, subViewHeight);
        SYAppInfo *appInfo = self.appInfos[i];
        
        UIImageView *iconView = [subView viewWithTag:5];
        iconView.image = [UIImage imageNamed:appInfo.icon];
        
        UILabel *nameLabel = [subView viewWithTag:10];
        nameLabel.text = appInfo.name;
    }
}

- (void) downloadClick {
    NSLog(@"==");
}

@end

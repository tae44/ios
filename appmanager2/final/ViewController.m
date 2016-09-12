//
//  ViewController.m
//  final
//
//  Created by 123 on 16/8/23.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"
#import "SYAppInfo.h"
#import "SYAppInfoView.h"

@interface ViewController ()

@property (nonatomic,strong) NSArray *appInfos;

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
    int totalColumn = 3;
    CGFloat subViewW = 100;
    CGFloat subViewH = 100;
    CGFloat marginX = (self.view.frame.size.width - totalColumn * subViewW) / (totalColumn + 1);
    CGFloat marginY = 20;
    for (int i = 0; i < self.appInfos.count; i++) {
        SYAppInfoView *subView = [SYAppInfoView appInfoView];
        [self.view addSubview:subView];
        int row = i / totalColumn;
        int column = i % totalColumn;
        CGFloat subViewX = marginX + column * (marginX + subViewW);
        CGFloat subViewY = 30 + row * (marginY + subViewH);
        subView.frame = CGRectMake(subViewX, subViewY, subViewW, subViewH);
        SYAppInfo *appInfo = self.appInfos[i];
        subView.appInfo = appInfo;
    }
}

@end

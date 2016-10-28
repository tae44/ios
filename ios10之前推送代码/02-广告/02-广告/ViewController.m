//
//  ViewController.m
//  02-广告
//
//  Created by apple on 15/2/5.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ViewController.h"
#import <iAd/iAd.h>

@interface ViewController () <ADBannerViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - 加载广告失败的时候会调用
- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    NSLog(@"%s", __func__);
}

#pragma mark - 用户打开广告,之后点击关闭的时候会调用该方法
- (void)bannerViewActionDidFinish:(ADBannerView *)banner
{
    NSLog(@"%s", __func__);
}

#pragma mark - 加载广告加载完成的时候会调用
- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    NSLog(@"%s", __func__);
}
#pragma mark - 即将加载广告的时候会调用
- (void)bannerViewWillLoadAd:(ADBannerView *)banner
{
    NSLog(@"%s", __func__);
}

@end

//
//  SYAppInfoView.m
//  final
//
//  Created by 123 on 16/8/23.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYAppInfoView.h"
#import "SYAppInfo.h"

@interface SYAppInfoView ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *nameView;

- (IBAction) downloadClick:(UIButton *) sender;

@end

@implementation SYAppInfoView

+ (instancetype) appInfoView {
    SYAppInfoView *subView = [[[NSBundle mainBundle] loadNibNamed:@"SYAppInfoView" owner:nil options:nil] lastObject];
    return subView;
}

- (void) setAppInfo:(SYAppInfo *) appInfo {
    _appInfo = appInfo;
    self.nameView.text = appInfo.name;
    self.iconView.image = [UIImage imageNamed:appInfo.icon];
}

- (IBAction)downloadClick:(UIButton *)sender {
    self.superview.userInteractionEnabled = NO;
    sender.enabled = NO;
    UILabel *tipView = [[UILabel alloc] init];
    [self.superview addSubview:tipView];
    tipView.text = [NSString stringWithFormat:@"正在下载:%@", self.appInfo.name];
    CGFloat tipW = 200;
    CGFloat tipH = 25;
    CGFloat tipX = (self.superview.frame.size.width - tipW) / 2;
    CGFloat tipY = (self.superview.frame.size.height - tipH) / 2;
    tipView.frame = CGRectMake(tipX, tipY, tipW, tipH);
    tipView.backgroundColor = [UIColor grayColor];
    tipView.textAlignment = NSTextAlignmentCenter;
    tipView.alpha = 0;
    tipView.layer.cornerRadius = 5;
    tipView.layer.masksToBounds = YES;
    [UIView animateWithDuration:1.0 animations:^{
        tipView.alpha = 0.9;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0 delay:2.0 options:UIViewAnimationOptionCurveLinear animations:^{
            tipView.alpha = 0;
        } completion:^(BOOL finished) {
            [tipView removeFromSuperview];
            self.superview.userInteractionEnabled = YES;
        }];
    }];
}

@end

//
//  CZLuckyNumberViewController.m
//  NetEaseLotterry
//
//  Created by Vincent_Guo on 14-9-7.
//  Copyright (c) 2014年 vgios. All rights reserved.
//

#import "CZLuckyNumberViewController.h"
#import "CZThreeButton.h"
#import "CZWheel.h"
@interface CZLuckyNumberViewController ()

@property(nonatomic,weak)CZWheel *wheel;
@property(nonatomic,weak)CZThreeButton *threeBtn;
@end

@implementation CZLuckyNumberViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self addBg];
    [self addThreeButton];
    [self addWheel];
}

-(void)addWheel{
    CZWheel *wheel = [CZWheel wheel];
    wheel.center = CGPointMake(self.view.frame.size.width * 0.5, wheel.frame.size.height * 0.5 + CGRectGetMaxY(self.threeBtn.frame) - 5);
    [self.view addSubview:wheel];
    if (!iOS7) {
        wheel.autoresizingMask = UIViewAutoresizingNone;
    }
    self.wheel = wheel;
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.wheel startRotating];
}


-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.wheel stopRotating];
}


#pragma mark 添加三个按钮
- (void)addThreeButton
{
    CZThreeButton *tb = [CZThreeButton threeButton];
    CGFloat tbCenterX = self.view.frame.size.width * 0.5;
    CGFloat tbCenterY = tb.frame.size.height * 0.5 + 10 + 64;
    if (!iOS7) {
        tbCenterY = tb.frame.size.height * 0.5 + 10;
    }
    
    tb.center = CGPointMake(tbCenterX, tbCenterY);
    [self.view addSubview:tb];
    self.threeBtn = tb;
}

#pragma mark 设置背景
- (void)addBg
{
    UIImageView *bgView = [[UIImageView alloc] init];
    CGRect bgFrm = CGRectMake(0, 0, 0, 0);
    if (iOS7) {
        bgFrm.origin.y +=64;
    }
    
    //bgView.autoresizingMask = UIViewAutoresizingNone;
    bgView.image = [UIImage imageNamed:is4Inch?@"LuckyBackground-568h.jpg":@"LuckyBackground.jpg"];
    CZLog(@"%@",NSStringFromCGSize(bgView.image.size));
    bgFrm.size = bgView.image.size;
    bgView.frame = bgFrm;
    [self.view addSubview:bgView];
}

@end

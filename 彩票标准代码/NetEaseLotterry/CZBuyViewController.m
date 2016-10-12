//
//  CZBuyViewController.m
//  NetEaseLotterry
//
//  Created by Vincent_Guo on 14-8-16.
//  Copyright (c) 2014年 vgios. All rights reserved.
//

#import "CZBuyViewController.h"
#import "CZTitleButton.h"

@interface CZBuyViewController ()
- (IBAction)titleBtnClick;
@property (weak, nonatomic) IBOutlet CZTitleButton *titleBtn;

@end

@implementation CZBuyViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
}


- (IBAction)titleBtnClick {
    
    //按钮旋转
    if (self.titleBtn.tag == 0) {
        self.titleBtn.tag = 1;
        [UIView animateWithDuration:0.25 animations:^{
            self.titleBtn.imageView.transform = CGAffineTransformMakeRotation(-M_PI);
        }];
    }else{
        self.titleBtn.tag = 0;
        [UIView animateWithDuration:0.25 animations:^{
            self.titleBtn.imageView.transform = CGAffineTransformIdentity;
        }];
    }
    
    
}
@end

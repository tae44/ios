//
//  SYFooterView.m
//  团购练习
//
//  Created by 123 on 16/8/30.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYFooterView.h"

@interface SYFooterView ()

@property (weak, nonatomic) IBOutlet UIButton *loadMoreBtn;

@property (weak, nonatomic) IBOutlet UIView *statusView;

- (IBAction)loadMoreBtnClick;

@end

@implementation SYFooterView

+ (instancetype)footerView {
    SYFooterView *footerView = [[[NSBundle mainBundle] loadNibNamed:@"SYFooterView" owner:nil options:nil] lastObject];
    return footerView;
}

- (IBAction)loadMoreBtnClick {
    self.loadMoreBtn.hidden = YES;
    self.statusView.hidden = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.loadMoreBtn.hidden = NO;
        self.statusView.hidden = YES;
        if ([self.delegate respondsToSelector:@selector(footerViewDidClickLoadMoreBtn:)]) {
            [self.delegate footerViewDidClickLoadMoreBtn:self];
        }
    });
}

@end

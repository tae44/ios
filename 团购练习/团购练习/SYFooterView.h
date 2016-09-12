//
//  SYFooterView.h
//  团购练习
//
//  Created by 123 on 16/8/30.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SYFooterView;

@protocol SYFooterViewDelegate <NSObject>

- (void)footerViewDidClickLoadMoreBtn:(SYFooterView *)footerView;

@end

@interface SYFooterView : UIView

@property (nonatomic, weak) id<SYFooterViewDelegate> delegate;

+ (instancetype)footerView;

@end

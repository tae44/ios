//
//  SYPaintView.h
//  涂鸦
//
//  Created by 123 on 16/9/23.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SYPaintView : UIView
/**画出来的颜色*/
@property (nonatomic, strong) UIColor *color;
/**线宽*/
@property (nonatomic ,assign) CGFloat width;

- (void)back;

- (void)clean;

- (void)changeLineWidth;

@end

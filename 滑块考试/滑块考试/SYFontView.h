//
//  SYFontView.h
//  滑块考试
//
//  Created by 123 on 16/9/5.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SYFontView;

//1 定义代理协议
@protocol SYFontViewDelegate <NSObject>

@optional

/**
 *  改变字体大小的代理方法
 *
 *  @param fontView fontView
 */
- (void)fontViewChangedFontSize:(SYFontView *)fontView;

/**
 *  点击字体按钮时候的代理方法
 *
 *  @param fontView fontView
 */
- (void)fontViewDidClickedBtn:(SYFontView *)fontView;

@end

@interface SYFontView : UIView

//滑块属性
@property (weak, nonatomic) IBOutlet UISlider *sliderView;

//字体大小
@property (nonatomic, assign) CGFloat fontSize;

//2 定义代理属性
@property (nonatomic, weak) id<SYFontViewDelegate> delegate;

+ (instancetype)fontView;

@end

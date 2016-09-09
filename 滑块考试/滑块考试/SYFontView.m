//
//  SYFontView.m
//  滑块考试
//
//  Created by 123 on 16/9/5.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYFontView.h"

@interface SYFontView ()

@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UIButton *btn4;

- (IBAction)sliderChanged:(UISlider *)sender;

- (IBAction)btnClicked:(UIButton *)sender;

@end

@implementation SYFontView

/**
 *  加载xib
 *
 *  @return SYFontView对象
 */
+ (instancetype)fontView {
    SYFontView *fontView = [[[NSBundle mainBundle] loadNibNamed:@"SYFontView" owner:nil options:nil] lastObject];
    return fontView;
}

/**
 *  加载xib完毕后执行
 */
- (void)awakeFromNib {
    self.frame = CGRectMake(0, 150, 320, 120);
    //设置max那边滑块的图片
    [self.sliderView setMaximumTrackImage:[UIImage imageNamed:@"正文字号-滑条"] forState:UIControlStateNormal];
    //设置min这边滑块的图片
    [self.sliderView setMinimumTrackImage:[UIImage imageNamed:@"正文字号-滑条红"] forState:UIControlStateNormal];
    //设置滑块本身的图片
    [self.sliderView setThumbImage:[UIImage imageNamed:@"正文字号-滑块"] forState:UIControlStateNormal];
    //初始时第一个按钮为选中状态
    self.btn1.selected = YES;
}

/**
 *  设置按钮是否为选中状态(可优化)
 *
 *  @param tag 按钮的tag值
 */
- (void)setBtnSelected:(NSInteger)tag {
    switch (tag) {
        case 1:
            self.btn1.selected = YES;
            self.btn2.selected = NO;
            self.btn3.selected = NO;
            self.btn4.selected = NO;
            break;
        case 2:
            self.btn1.selected = NO;
            self.btn2.selected = YES;
            self.btn3.selected = NO;
            self.btn4.selected = NO;
            break;
        case 3:
            self.btn1.selected = NO;
            self.btn2.selected = NO;
            self.btn3.selected = YES;
            self.btn4.selected = NO;
            break;
        case 4:
            self.btn1.selected = NO;
            self.btn2.selected = NO;
            self.btn3.selected = NO;
            self.btn4.selected = YES;
            break;
        default:
            break;
    }
}

/**
 *  滑动滑块时执行的方法
 *
 *  @param sender sender(可省略)
 */
- (IBAction)sliderChanged:(UISlider *)sender {
    if (self.sliderView.value < 20) {
        [self setBtnSelected:1];
    } else if (self.sliderView.value >= 20 && self.sliderView.value < 25) {
        [self setBtnSelected:2];
    } else if (self.sliderView.value >= 25 && self.sliderView.value < 30) {
        [self setBtnSelected:3];
    } else {
        [self setBtnSelected:4];
    }
    //3 在合适的地方调用代理方法
    if ([self.delegate respondsToSelector:@selector(fontViewChangedFontSize:)]) {
        [self.delegate fontViewChangedFontSize:self];
    }
}

/**
 *  设置相关状态的方法
 *
 *  @param size  字体大小
 *  @param value 滑块值
 *  @param tag   按钮tag值
 */
- (void)setFontSize:(CGFloat)size andSliderValue:(int)value andBtnTag:(NSInteger)tag{
    self.fontSize = size;
    self.sliderView.value = value;
    [self setBtnSelected:tag];
}

/**
 *  点击字体按钮时执行的方法
 *
 *  @param sender 按钮本身
 */
- (IBAction)btnClicked:(UIButton *)sender {
    switch (sender.tag) {
        case 1:
            [self setFontSize:15 andSliderValue:15 andBtnTag:1];
            break;
        case 2:
            [self setFontSize:20 andSliderValue:20 andBtnTag:2];
            break;
        case 3:
            [self setFontSize:25 andSliderValue:25 andBtnTag:3];
            break;
        case 4:
            [self setFontSize:30 andSliderValue:30 andBtnTag:4];
            break;
        default:
            break;
    }
    if ([self.delegate respondsToSelector:@selector(fontViewDidClickedBtn:)]) {
        [self.delegate fontViewDidClickedBtn:self];
    }
}

@end

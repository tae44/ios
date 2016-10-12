//
//  SYTabbar.m
//  彩票
//
//  Created by jason on 2016/10/9.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYTabbar.h"

@interface SYTabbar ()

/**
 当前选中的按钮
 */
@property (nonatomic, weak) UIButton *selectedBtn;

@end

/*
 *自定义控件
 1.在initWithFrame初始化的方法，添加子控件
 2.layoutSubviews 布局子控件frm
 */

/*
 //调用控件的init方法【[[UIView alloc] init]】 的时候被调用  接着还会调用initWithFrame
 //-(instancetype)init
 
 
 //调用控件的init方法【[[UIView alloc] initWithFrame]】 的时候被调用
 //-(instancetype)initWithFrame:(CGRect)frame
 
 
 //调用控件的创建从xib/storybaord 的时候被调用
 -(id)initWithCoder:(NSCoder *)aDecoder
 */

@implementation SYTabbar

//- (instancetype)initWithFrame:(CGRect)frame {
//    if (self = [super initWithFrame:frame]) {
//        [self setupBtns];
//    }
//    return self;
//}

/**
 初始化按钮
 */
//- (void)setupBtns {
//    //自定义tabbar的五个按钮
//    for (NSInteger i = 0; i < 5; i++) {
//        // 普通状态的图片名称
//        NSString *normalImg = [NSString stringWithFormat:@"TabBar%ld", i+1];
//        // 选中状态的图片名称
//        NSString *selImg = [NSString stringWithFormat:@"TabBar%ldSel", i+1];
//        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [btn setBackgroundImage:[UIImage imageNamed:normalImg] forState:UIControlStateNormal];
//        [btn setBackgroundImage:[UIImage imageNamed:selImg] forState:UIControlStateSelected];
//        // 监听事件
//        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//        // 绑定tag
//        btn.tag = i;
//        [self addSubview:btn];
//        if (i == 0) {
//            btn.selected = YES;
//            self.selectedBtn = btn;
//        }
//    }
//}

#pragma mark 初始化按钮

- (void)addTabbarBtnWithNormalImg:(NSString *)normalImg selImg:(NSString *)selImg {
    UIButton *btn = [SYTabbarButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:normalImg] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:selImg] forState:UIControlStateSelected];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    btn.tag = self.subviews.count;
    [self addSubview:btn];
    if (btn.tag == 0) {
        [self btnClick:btn];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    // 布局子控件
    NSInteger count = self.subviews.count;
    CGFloat btnW = self.bounds.size.width / count;
    CGFloat btnH = self.bounds.size.height;
//    for (NSInteger i = 0; i < 5; i++) {
//        // 获取按钮对象
//        UIButton *btn = self.subviews[i];
//        btn.frame = CGRectMake(btnW * i, 0, btnW, btnH);
//    }
    for (UIButton *btn in self.subviews) {
        btn.frame = CGRectMake(btnW * btn.tag, 0, btnW, btnH);
    }
}

- (void)btnClick:(UIButton *)btn {
    // 通知代理
    if ([self.delegate respondsToSelector:@selector(tabbar:didSelectedTo:)]) {
        [self.delegate tabbar:self didSelectedTo:btn.tag];
    }
    // 取消之前的选中
    self.selectedBtn.selected = NO;
    // 设置当前选中
    btn.selected = YES;
    self.selectedBtn = btn;
}

@end

// 实现自定义的btn
@implementation SYTabbarButton

/**
 图片高亮时调用这个方法
 */
- (void)setHighlighted:(BOOL)highlighted {
    // 只要不调用父类的方法,按钮就不会有高度的效果
    // [super setHighlighted:highlighted];
}

@end




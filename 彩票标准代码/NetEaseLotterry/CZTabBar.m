//
//  CZTabBar.m
//  NetEaseLotterry
//
//  Created by Vincent_Guo on 14-8-3.
//  Copyright (c) 2014年 vgios. All rights reserved.
//

#import "CZTabBar.h"
#import "CZTabBarButton.h"

#define CZTabBarButtonCount 5

@interface CZTabBar()

@property(nonatomic,weak)CZTabBarButton *selectedBtn;

@end

@implementation CZTabBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

-(void)addTabBarButtonWithNormalBg:(NSString *)normalBg selBg:(NSString *)selBg{
    CZTabBarButton *btn = [[CZTabBarButton alloc] init];
    btn.tag = self.subviews.count;
    [btn setBackgroundImage:[UIImage imageNamed:normalBg] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:selBg] forState:UIControlStateSelected];
    [self addSubview:btn];
    
    //添加按钮监听
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    
    if (btn.tag == 0) {
        [self btnClick:btn];
    }
}



-(void)layoutSubviews{
    [super layoutSubviews];
    
    int count = self.subviews.count;
    for (int i = 0; i < count; i ++) {
        CZTabBarButton *btn = self.subviews[i];
        //设置btn的frm
        CGFloat btnW = self.frame.size.width / count;
        CGFloat btnH =self.frame.size.height;
        CGFloat btnX = btnW * i;
        CGFloat btnY = 0;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
}

-(void)btnClick:(CZTabBarButton *)btn{
    
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectBtnFrom:to:)]) {
        [self.delegate tabBar:self didSelectBtnFrom:self.selectedBtn.tag to:btn.tag];
    }
    
    //取消之前按钮的选中状态
    self.selectedBtn.selected = NO;
    
    //设置新按钮的选中状态
    btn.selected = YES;
    
    //设置新的选中按钮
    self.selectedBtn = btn;

}
@end

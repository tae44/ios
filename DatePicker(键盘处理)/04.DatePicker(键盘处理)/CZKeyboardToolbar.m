//
//  CZKeyboardToolbar.m
//  04.DatePicker(键盘处理)
//
//  Created by Apple on 14/12/26.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "CZKeyboardToolbar.h"

@interface CZKeyboardToolbar()

@end

@implementation CZKeyboardToolbar

+(instancetype)toolbar{
    return [[[NSBundle mainBundle] loadNibNamed:@"CZKeyboardToolbar" owner:nil options:nil] lastObject];
}

- (IBAction)itemBtnClick:(id)sender {
    //判断代理有没有实现方法
    if ([self.kbDelegate respondsToSelector:@selector(keyboardToolbar:btndidSelected:)]) {
        [self.kbDelegate keyboardToolbar:self btndidSelected:sender];
    }
}

@end

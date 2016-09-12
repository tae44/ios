//
//  SYKeyboardToolbar.m
//  多个UITextField处理
//
//  Created by 123 on 16/9/12.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYKeyboardToolbar.h"

@implementation SYKeyboardToolbar

+ (instancetype)toolbar {
    return [[[NSBundle mainBundle] loadNibNamed:@"SYKeyboardToolbar" owner:nil options:nil] lastObject];
}

- (IBAction)itemBtnClick:(id)sender {
    if ([self.kbdelegate respondsToSelector:@selector(keyboardToolbar:btnDidSelected:)]) {
        [self.kbdelegate keyboardToolbar:self btnDidSelected:sender];
    }
}

@end

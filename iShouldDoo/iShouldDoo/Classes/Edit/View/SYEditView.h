//
//  SYEditView.h
//  iShouldDoo
//
//  Created by jason on 2016/10/14.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SYEditView : UIView

@property (weak, nonatomic) UITextField *nameTextField;

@property (weak, nonatomic) UITextView *commentTextField;

@property (weak, nonatomic) UIButton *saveBtn;

+ (instancetype)editView;

- (void)createContent;

@end

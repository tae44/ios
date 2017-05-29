//
//  SYAddView.h
//  iShouldDoo
//
//  Created by jason on 2016/10/14.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SYAddView : UIView

/**任务名称输入框*/
@property (weak, nonatomic) UITextField *nameTextField;
/**任务备注输入框*/
@property (weak, nonatomic) UITextView *commentTextField;

+ (instancetype)addView;

- (void)createContent;

@end

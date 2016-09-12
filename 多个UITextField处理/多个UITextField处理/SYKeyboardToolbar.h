//
//  SYKeyboardToolbar.h
//  多个UITextField处理
//
//  Created by 123 on 16/9/12.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SYKeyboardToolbar;

@protocol SYKeyboardToolbarDelegate <NSObject>

@optional
- (void)keyboardToolbar:(SYKeyboardToolbar *)toolbar btnDidSelected:(UIBarButtonItem *)item;

@end

@interface SYKeyboardToolbar : UIToolbar

@property (nonatomic, weak) id<SYKeyboardToolbarDelegate> kbdelegate;

+ (instancetype)toolbar;

/**上一个按钮*/
@property (weak, nonatomic) IBOutlet UIBarButtonItem *preBtn;
/**下一个按钮*/
@property (weak, nonatomic) IBOutlet UIBarButtonItem *nextBtn;

@end

//
//  SYTabbar.h
//  彩票
//
//  Created by jason on 2016/10/9.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SYTabbar;

@protocol SYTabbarDelegate <NSObject>

@optional
- (void)tabbar:(SYTabbar *)tabbar didSelectedTo:(NSInteger)to;

@end

@interface SYTabbar : UIView

@property (nonatomic, weak) id<SYTabbarDelegate> delegate;

/**
 传普通状态和选中状态图片名称,内部就帮你添加一个按钮

 @param normalImg 普通状态图片名称
 @param selImg    选中状态图片名称
 */
- (void)addTabbarBtnWithNormalImg:(NSString *)normalImg selImg:(NSString *)selImg;

@end

// 自定义按钮
@interface SYTabbarButton : UIButton

@end

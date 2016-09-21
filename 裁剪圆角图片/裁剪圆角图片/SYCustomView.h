//
//  SYCustomView.h
//  裁剪圆角图片
//
//  Created by jason on 2016/9/21.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SYCustomView : UIView

/**图片名称*/
@property (nonatomic, copy) NSString *imageName;
/**边框颜色*/
@property (nonatomic, strong) UIColor *boardColor;
/**边框宽度*/
@property (nonatomic, assign) CGFloat boardWidth;

@end

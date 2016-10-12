//
//  CZWheel.h
//  转盘
//
//  Created by Vincent_Guo on 14-9-7.
//  Copyright (c) 2014年 vgios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CZWheel : UIView


+(instancetype)wheel;

/**
 *  开始不停的旋转
 */
-(void)startRotating;


/**
 *  停止的旋转
 */
-(void)stopRotating;


@end

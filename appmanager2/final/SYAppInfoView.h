//
//  SYAppInfoView.h
//  final
//
//  Created by 123 on 16/8/23.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SYAppInfo;

@interface SYAppInfoView : UIView

@property (nonatomic,strong) SYAppInfo *appInfo;

+ (instancetype) appInfoView;

@end

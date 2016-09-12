//
//  FlagView.h
//  02.国旗选择
//
//  Created by Apple on 14/12/26.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Flag;

@interface FlagView : UIView

+(instancetype)flagView;

@property(nonatomic,strong)Flag *flag;

@end

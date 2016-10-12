//
//  CZAboutHeaderView.m
//  NetEaseLotterry
//
//  Created by Vincent_Guo on 14-9-6.
//  Copyright (c) 2014年 vgios. All rights reserved.
//

#import "CZAboutHeaderView.h"

@implementation CZAboutHeaderView

+(instancetype)aboutHeaderView{
    return [[[NSBundle mainBundle] loadNibNamed:@"CZAboutHeaderView" owner:nil options:nil] lastObject];
}

@end

//
//  CZThreeButton.m
//  NetEaseLotterry
//
//  Created by Vincent_Guo on 14-9-7.
//  Copyright (c) 2014年 vgios. All rights reserved.
//

#import "CZThreeButton.h"

@implementation CZThreeButton

+ (instancetype)threeButton
{
    return [[NSBundle mainBundle] loadNibNamed:@"CZThreeButton" owner:nil options:nil][0];
}

@end

//
//  CZTabBarButton.m
//  NetEaseLotterry
//
//  Created by Vincent_Guo on 14-8-3.
//  Copyright (c) 2014年 vgios. All rights reserved.
//

#import "CZTabBarButton.h"

@implementation CZTabBarButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)setHighlighted:(BOOL)highlighted{
    //调用super的方法会显示高度图片
    //[super setHighlighted:highlighted];
}

@end

//
//  SYLockView.m
//  手势解锁
//
//  Created by 123 on 16/9/23.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYLockView.h"

@implementation SYLockView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib {
    [super awakeFromNib];
    CGFloat btnW = 74;
    CGFloat btnH = 74;
    CGFloat margin = (self.frame.size.width - 3 * btnW) / 4;
    for (NSInteger i = 0; i < 9; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:btn];
        NSInteger column = i % 3;
        NSInteger row = i / 3;
        CGFloat btnX = margin + (margin + btnW) * column;
        CGFloat btnY = margin + (margin * btnH) * row;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        [btn setImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
    }
    NSLog(@"%ld", self.subviews.count);//9
}

@end

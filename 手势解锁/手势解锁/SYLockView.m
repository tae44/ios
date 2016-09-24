//
//  SYLockView.m
//  手势解锁
//
//  Created by 123 on 16/9/23.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYLockView.h"

@interface SYLockView ()

/**
 选中的所有按钮
 */
@property (nonatomic, strong) NSMutableArray *selectedBtns;

/**
 记录最后一个触点位置
 */
@property (nonatomic, assign) CGPoint lastPoint;

@end

@implementation SYLockView

- (NSMutableArray *)selectedBtns {
    if (!_selectedBtns) {
        _selectedBtns = [NSMutableArray array];
    }
    return _selectedBtns;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // 设置按钮高度和宽度
    CGFloat btnW = 74;
    CGFloat btnH = 74;
    // 设置间隔距离
    CGFloat margin = (self.frame.size.width - 3 * btnW) / 4;
    for (NSInteger i = 0; i < 9; i++) {
        // 创建按钮并添加到view上
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];
        // 设置按钮tag
        btn.tag = i;
        // 让按钮无法点击
        btn.userInteractionEnabled = NO;
        [self addSubview:btn];
        // 计算按钮的frame
        NSInteger column = i % 3;
        NSInteger row = i / 3;
        CGFloat btnX = margin + (margin + btnW) * column;
        CGFloat btnY = margin + (margin + btnH) * row;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
}

- (void)drawRect:(CGRect)rect {
    NSInteger selectedCount = self.selectedBtns.count;
    // 如果没有按钮选中,则直接返回
    if (selectedCount == 0) return;
    // 创建路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    for (NSInteger i = 0; i < selectedCount; i++) {
        CGPoint btnCenter = [self.selectedBtns[i] center];
        if (i == 0) {
            // 为0的话设置起点
            [path moveToPoint:btnCenter];
        } else {
            [path addLineToPoint:btnCenter];
        }
    }
    // 画出最后一个点
    [path addLineToPoint:self.lastPoint];
    // 设置线的样式
    path.lineWidth = 8;
    path.lineJoinStyle = kCGLineJoinRound;
    path.lineCapStyle = kCGLineCapRound;
    [[UIColor greenColor] set];
    // 渲染
    [path stroke];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:touch.view];
    for (UIButton *btn in self.subviews) {
        // 如果currentPoint点在btn.frame的范围内
        if (CGRectContainsPoint(btn.frame, currentPoint)) {
            if (btn.selected == NO) {
                [self.selectedBtns addObject:btn];
            }
            btn.selected = YES;
        } else {
            self.lastPoint = currentPoint;
        }
    }
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 拼接选中按钮的索引
    NSMutableString *password = [NSMutableString string];
    for (UIButton *selectdBtn in self.selectedBtns) {
        [password appendFormat:@"%ld", selectdBtn.tag];
    }
    NSLog(@"password:%@", password);
    // 取消联线
    // 设置所有按钮选中状态为NO
    [self.selectedBtns makeObjectsPerformSelector:@selector(setSelected:) withObject:NO];//@NO
    // 移除所有选中按钮
    [self.selectedBtns removeAllObjects];
    [self setNeedsDisplay];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self touchesMoved:touches withEvent:event];
}

@end

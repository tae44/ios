//
//  SYCustomView.m
//  触摸事件
//
//  Created by jason on 2016/9/23.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYCustomView.h"

@implementation SYCustomView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 获取当前触摸点的UITouch对象
    UITouch *touch = [touches anyObject];
    // 触摸点所在的view
    NSLog(@"%@", touch.view);
    // 点击次数
    NSLog(@"%ld", touch.tapCount);
    // 获取当前触摸的位置
    // locationInView参数如果为nil,获取的触摸点位置是在windows上面的
    CGPoint point = [touch locationInView:nil];
    NSLog(@"%@", NSStringFromCGPoint(point));
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    // 获取当前触摸点的位置
    CGPoint currentPoint = [touch locationInView:touch.view];
    // 获取上一个触摸点的位置
    CGPoint previousPoint = [touch previousLocationInView:touch.view];
    NSLog(@"上一个触摸点:%@, 当前触摸点:%@",NSStringFromCGPoint(previousPoint),NSStringFromCGPoint(currentPoint));
    // 改变位置
    CGPoint center = self.center;
    center.x += currentPoint.x - previousPoint.x;
    center.y += currentPoint.y - previousPoint.y;
    self.center = center;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = touch.view.frame.origin;
    CGPoint superPoint = self.superview.frame.origin;
    // 如果拖动结束后x或者y的边界出了父类边界,则自动回到父类的中心
    if (touchPoint.x < 0 || touchPoint.y < 0 || touchPoint.x > superPoint.x || touchPoint.y > superPoint.y) {
        [UIView animateWithDuration:1.0 animations:^{
            touch.view.center = self.superview.center;
        }];
    }
}

//- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    
//}

@end

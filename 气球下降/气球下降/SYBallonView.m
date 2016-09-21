//
//  SYBallonView.m
//  气球下降
//
//  Created by jason on 2016/9/21.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYBallonView.h"

@interface SYBallonView ()

/**记录当前气球绘制的位置*/
@property (nonatomic, assign) CGPoint position;
/**定时器*/
@property (nonatomic, strong) CADisplayLink *link;

@end

@implementation SYBallonView

//drawRect会在View显示到屏幕的时候调用一次
- (void)drawRect:(CGRect)rect {
    //每次刷新y坐标
    CGPoint newPosition = self.position;
    newPosition.y += 10;
    //判断是否到达底部
    if (newPosition.y > rect.size.height) {
        newPosition.y = 0;
    }
    self.position = newPosition;
    UIImage *image = [UIImage imageNamed:@"sandyBalloon"];
    [image drawAtPoint:self.position];
}

//因为现在这个view的创建方法,是在storyboard或者xib上,所以不会调用init
//- (instancetype)init {
//    [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(setNeedsDisplay) userInfo:nil repeats:YES];
//    return self;
//}

- (void)awakeFromNib{
    //写一个定时器，重绘当前的View
    //调用了setNeedsDisplay方法,内部会调用drawRect方法进行重绘
    //[NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(setNeedsDisplay) userInfo:nil repeats:YES];
    [self addAnimation];
}

/**
 使用CADisplayLink定时器方式
 */
- (void)addAnimation {
    //CADisplayLink定时器 一秒执行60次
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(setNeedsDisplay)];
    //CADisplayLink定时器一定要添加到主运行循环才执行
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    self.link = link;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //停止定时器
    [self.link invalidate];
    //移除主运行循环,不需要手写,因为invalidate方法,内部会把主定时,从主运行循环移除
    //[self.link removeFromRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

@end

//
//  SYBallonView.m
//  多气球上升
//
//  Created by jason on 2016/9/21.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYBallonView.h"

@interface SYBallonView ()

/**记录所有气球绘制的位置*/
@property (nonatomic, strong) NSMutableArray *locations;
/**所有气球*/
@property (nonatomic, strong) NSMutableArray *ballons;
/**定时器*/
@property (nonatomic, strong) CADisplayLink *link;

@end

@implementation SYBallonView

- (NSMutableArray *)locations {
    if (!_locations) {
        _locations = [NSMutableArray array];
    }
    return _locations;
}

/**
 通过懒加载方式,初始化图片和位置
 */
- (NSMutableArray *)ballons {
    if (!_ballons) {
        _ballons = [NSMutableArray array];
        NSInteger count = 6;
        UIImage *ballonImage = [UIImage imageNamed:@"sandyBalloon"];
        for (NSInteger i = 0; i < count; i++) {
            //初始化每一个气球的位置
            //气球之间的间距
            CGFloat ballonMargin = 50;
            CGPoint location = CGPointMake(ballonMargin + ballonMargin * i, self.frame.size.height);
            //存入位置数组
            [self.locations addObject:[NSValue valueWithCGPoint:location]];
            [_ballons addObject:ballonImage];
        }
    }
    return _ballons;
}

- (void)drawRect:(CGRect)rect {
    NSInteger ballonCount = self.ballons.count;
    for (NSInteger i = 0; i < ballonCount; i++) {
        //获取对应位置的气球
        UIImage *ballon = self.ballons[i];
        //获取对应气球的位置
        CGPoint location = [self.locations[i] CGPointValue];
        //更改每一个气球位置
        //遍历气球,获取当前气球的位置,y方向上减随机的距离
        location.y -= arc4random_uniform(10) * 0.5;
        //判断是否到达顶部
        if (location.y + ballon.size.height < 0) {
            location.y = rect.size.height;
        }
        //更新位置数组里的值
        [self.locations replaceObjectAtIndex:i withObject:[NSValue valueWithCGPoint:location]];
        [ballon drawAtPoint:location];
    }
}

- (void)awakeFromNib {
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(setNeedsDisplay)];
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

@end

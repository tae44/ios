//
//  ViewController.m
//  底部旋转菜单
//
//  Created by jason on 2016/9/29.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"
// 动画时间
#define DURATION 5
// 按钮间距
#define DELTA 90

@interface ViewController ()
/**最上面的红色按钮*/
@property (weak, nonatomic) IBOutlet UIButton *mainBtn;
@property (weak, nonatomic) IBOutlet UIButton *callBtn;
@property (weak, nonatomic) IBOutlet UIButton *peopleBtn;
@property (weak, nonatomic) IBOutlet UIButton *messageBtn;

/**存放三个隐藏按钮的数组*/
@property(nonatomic,strong)NSMutableArray *items;

@end

@implementation ViewController

- (NSMutableArray *)items {
    if (!_items) {
        _items = [NSMutableArray array];
        [_items addObjectsFromArray:@[self.callBtn, self.messageBtn, self.peopleBtn]];
    }
    return _items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

/**
 点击主红色按钮
 */
- (IBAction)mainBtnClick {
    // 判断主按钮是否改变了transform
    BOOL show = CGAffineTransformIsIdentity(self.mainBtn.transform);
    [UIView animateWithDuration:DURATION animations:^{
        if (show) { // 如果没改变则旋转
            self.mainBtn.transform = CGAffineTransformMakeRotation(M_PI_4);
        } else { // 改变了则还原
            self.mainBtn.transform = CGAffineTransformIdentity;
        }
    }];
    [self showOtherBtn:show];
}

/**
 是否显示或隐藏剩余三个按钮

 @param show 主按钮transform是否改变
 */
- (void)showOtherBtn:(BOOL)show {
    for (UIButton *btn in self.items) {
        // 一个按钮对应一个组动画
        CAAnimationGroup *group = [CAAnimationGroup animation];
        group.duration = DURATION;
        // 创建平移动画
        CAKeyframeAnimation *positionAni = [CAKeyframeAnimation animation];
        positionAni.keyPath = @"position";
        // 创建旋转动画
        CAKeyframeAnimation *rotationAni = [CAKeyframeAnimation animation];
        rotationAni.keyPath = @"transform.rotation";
        // 重新设置每个按钮的x值
        CGFloat btnCenterX = self.mainBtn.center.x + (btn.tag + 1) * DELTA;
        CGFloat btnCenterY = self.mainBtn.center.y;
        // 最终显示的位置
        CGPoint showPosition = CGPointMake(btnCenterX, btnCenterY);
        // 设置平移动画的路径
        NSValue *p1 = [NSValue valueWithCGPoint:self.mainBtn.center];
        NSValue *p2 = [NSValue valueWithCGPoint:CGPointMake(btnCenterX * 0.5, btnCenterY)];
        NSValue *p3 = [NSValue valueWithCGPoint:CGPointMake(btnCenterX * 1.1, btnCenterY)];
        NSValue *p4 = [NSValue valueWithCGPoint:showPosition];
        if (show) {
            positionAni.values = @[p1, p2, p3, p4];
            rotationAni.values = @[@0, @(M_PI * 2), @(M_PI * 4), @(M_PI * 2)];
            btn.center = showPosition;
        } else {
            positionAni.values = @[p4, p3, p2, p1];
            rotationAni.values = @[@0, @(M_PI * 2), @0, @(-M_PI * 2)];
            btn.center = self.mainBtn.center;
        }
        group.animations = @[positionAni, rotationAni];
        [btn.layer addAnimation:group forKey:nil];
    }
}

@end

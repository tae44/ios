//
//  ViewController.m
//  愤怒的小鸟
//
//  Created by jason on 2016/10/28.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *bird;
@property (weak, nonatomic) IBOutlet UIImageView *ice1;
@property (weak, nonatomic) IBOutlet UIImageView *ice2;
@property (weak, nonatomic) IBOutlet UIImageView *ice3;
@property (weak, nonatomic) IBOutlet UIImageView *ice4;

@property (nonatomic, strong) UIDynamicAnimator *animator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (UIDynamicAnimator *)animator {
    if (!_animator) {
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    }
    return _animator;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 创建重力仿真行为
    NSArray *items = @[self.bird, self.ice1, self.ice2, self.ice3, self.ice4];
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:items];
    // 创建碰撞仿真行为
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:items];
    // 将参照视图的bounds作为边界
    collision.translatesReferenceBoundsIntoBoundary = YES;
    // 创建推动仿真行为(创建的时候需要传入一个枚举)
    // UIPushBehaviorModeContinuous    持续的
    // UIPushBehaviorModeInstantaneous 非持续的
    UIPushBehavior *push = [[UIPushBehavior alloc] initWithItems:@[self.bird] mode:UIPushBehaviorModeInstantaneous];
    // 设置push作用的向量(方向和大小)
    push.pushDirection = CGVectorMake(2.0, 0);
    // 将仿真行为添加到仿真器
    [self.animator addBehavior:gravity];
    [self.animator addBehavior:collision];
    [self.animator addBehavior:push];
}

@end

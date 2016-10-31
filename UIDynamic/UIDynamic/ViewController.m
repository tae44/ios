//
//  ViewController.m
//  UIDynamic
//
//  Created by jason on 2016/10/28.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet UIView *greenView;

@property (nonatomic, strong) UIDynamicAnimator *animator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (UIDynamicAnimator *)animator {
    if (!_animator) {
        // 创建一个仿真器
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    }
    return _animator;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 获取用户点击的点
    CGPoint point = [[touches anyObject] locationInView:self.view];
    // 删除旧的捕捉行为
    [self.animator removeAllBehaviors];
    // 创建新的捕捉仿真行为
    // 捕捉行为,每次只能捕捉一个,也就是如果你之前已经向仿真器中添加了捕捉行为,再次添加,就没有效果
    UISnapBehavior *snap = [[UISnapBehavior alloc] initWithItem:self.redView snapToPoint:point];
    // damping减震,取值范围是0.0~1.0,值越小,振幅越大
    snap.damping = 0.3;
    [self.animator addBehavior:snap];
}

/**
 添加新边界测试
 */
- (void)test1 {
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.redView, self.greenView]];
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[self.redView, self.greenView]];
    collision.translatesReferenceBoundsIntoBoundary = YES;
    // 添加新边界
    // [collision addBoundaryWithIdentifier:@"line" fromPoint:CGPointMake(0, 500) toPoint:CGPointMake(320, 500)];
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRect:self.greenView.frame];
    [collision addBoundaryWithIdentifier:@"greenView" forPath:bezierPath];
    [self.animator addBehavior:gravity];
    [self.animator addBehavior:collision];
}

/**
 两个仿真元素的碰撞行为
 */
- (void)testTwoCollision {
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.redView]];
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[self.redView, self.greenView]];
    collision.translatesReferenceBoundsIntoBoundary = YES;
    [self.animator addBehavior:gravity];
    [self.animator addBehavior:collision];
}

/**
 仿真重力和碰撞
 */
- (void)testGravityAndCollision {
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.blueView]];
    // 创建碰撞仿真行为
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[self.blueView]];
    // 将参照视图的bounds作为边界
    collision.translatesReferenceBoundsIntoBoundary = YES;
    // 将仿真行为添加到仿真器中
    [self.animator addBehavior:gravity];
    [self.animator addBehavior:collision];
}

/**
 重力仿真
 */
- (void)testGravity {
    // 创建仿真行为
    // items:仿真元素,就是你要对谁进行仿真
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.blueView]];
    // 设置向量:可以决定我们重力仿真的大小和方向
    // gravity.gravityDirection = CGVectorMake(3.0, 1.0);
    // angle默认是M_PI_2
    // gravity.angle = M_PI_4;
    // magnitude默认的值是1.0,设置加速度的大小
    gravity.magnitude = 5.0;
    // 将仿真行为添加到仿真器中
    [self.animator addBehavior:gravity];
}

@end

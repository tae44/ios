//
//  ViewController.m
//  图层的隐式动画
//
//  Created by jason on 2016/9/27.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
/**非根层*/
@property (nonatomic, weak) CALayer *layer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     weak 与 strong 使用
     只要这个对象被强引用一次，就无须再次强引用
     */
    
    // 创建一个非根层
    CALayer *layer = [CALayer layer];
    // 设置内容
    layer.contents = (id)[UIImage imageNamed:@"papa"].CGImage;
    // 设置大小
    layer.bounds = CGRectMake(0, 0, 100, 100);
    // 设置位置
    layer.position = CGPointMake(150, 250);
    // 设置锚点
    layer.anchorPoint = CGPointMake(0.5, 0.5);
    [self.view.layer addSublayer:layer];
    self.layer = layer;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // self.imageView.layer 它是根层
    // 根层改变属性是没有动画,只有非根层改变属性才有默认的动画
    self.imageView.layer.bounds = CGRectMake(0, 0, 150, 150);
    // 设置非根层动画属性
    // 隐式动画开始
    [CATransaction begin];
    // 关闭隐式动画
    // [CATransaction setDisableActions:YES];
    // 设置动画时间
    [CATransaction setAnimationDuration:3.0];
    self.layer.transform = CATransform3DMakeRotation(M_PI_4, 1, 1, 1);
    // 提交动画
    [CATransaction commit];
}

@end

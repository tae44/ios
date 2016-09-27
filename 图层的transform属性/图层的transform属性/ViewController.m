//
//  ViewController.m
//  图层的transform属性
//
//  Created by jason on 2016/9/27.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *testView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.testView.layer.contents = (id)[UIImage imageNamed:@"papa"].CGImage;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 缩放,第三个参数sz看不到效果
    // self.testView.layer.transform = CATransform3DMakeScale(1.5, 1.5, 0);
    
    // 旋转
    // 1, 0, 0 x轴旋转
    // 0, 1, 0 y轴旋转
    // 0, 0, 1 z轴旋转
    // self.testView.layer.transform = CATransform3DMakeRotation(M_PI_4, 1, 0, 0);
    
    // 平移
    // self.testView.layer.transform = CATransform3DMakeTranslation(10, 10, 0);
    
    // 使用KVC的方法改变属性的值
    // [self.testView.layer setValue:[NSValue valueWithCATransform3D:CATransform3DMakeTranslation(20, 20, 0)] forKey:@"transform"];
    
    // transform里有更具体的形变属性
    // 缩放
    // transform.scale.x 代表x方向上缩放
    // transform.scale.y 代表y方向上缩放
    // [self.testView.layer setValue:@1.5 forKeyPath:@"transform.scale.y"];
    
    // 旋转
    // transform.rotation.z z轴旋转
    // transform.rotation.x x轴旋转
    // transform.rotation.y y轴旋转
    // [self.testView.layer setValue:@(M_PI_4) forKeyPath:@"transform.rotation.y"];
    
    // 平移
    // transfrom.translation.x x方向移动
    // transfrom.translation.y y方向移动
    // [self.testView.layer setValue:@(-20) forKeyPath:@"transform.translation.y"];
    
    // 不具体指定x还是y方向的移动
    // [self.testView.layer setValue:[NSValue valueWithCGPoint:CGPointMake(20, 20)] forKeyPath:@"transform.translation"];
    
    
    // kvc设置不仅限于transform属性，只要layer有的属性，都可以设置
    [self.testView.layer setValue:[NSValue valueWithCGRect:CGRectMake(0, 0, 200, 200)] forKey:@"bounds"];
}

@end

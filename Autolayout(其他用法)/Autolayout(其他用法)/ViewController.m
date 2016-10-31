//
//  ViewController.m
//  Autolayout(其他用法)
//
//  Created by jason on 2016/10/28.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *redView;
/**top的约束,约束也可以拖线*/
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *redYcon;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self test2];
}

- (void)test1 {
    CGRect frame = self.redView.frame;
    frame.origin.y += 50;
    [UIView animateWithDuration:1.0 animations:^{
        self.redView.frame = frame;
    }];
}

- (void)test2 {
    self.redYcon.constant += 100;
    [UIView animateWithDuration:1.0 animations:^{
        // 更新redView所有的约束,并且会更新redView所有子控件约束,对于self.view同理
        [self.view layoutIfNeeded];
    }];
}

@end

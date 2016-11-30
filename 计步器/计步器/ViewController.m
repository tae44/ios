//
//  ViewController.m
//  计步器
//
//  Created by jason on 2016/11/1.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *stepLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 判断计步器是否可用
    if (![CMStepCounter isStepCountingAvailable]) return;
    // 创建计步器对象
    CMStepCounter *stepCounter = [[CMStepCounter alloc] init];
    // 开始计步(走多少步之后调用一次该方法)
    [stepCounter startStepCountingUpdatesToQueue:[NSOperationQueue mainQueue] updateOn:5 withHandler:^(NSInteger numberOfSteps, NSDate * _Nonnull timestamp, NSError * _Nullable error) {
        self.stepLabel.text = [NSString stringWithFormat:@"您已经走了%ld步", numberOfSteps];
    }];
}

@end

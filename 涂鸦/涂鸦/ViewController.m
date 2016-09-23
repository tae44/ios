//
//  ViewController.m
//  涂鸦
//
//  Created by 123 on 16/9/23.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"
#import "SYPaintView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet SYPaintView *paintView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

/**
 点击回退按钮
 */
- (IBAction)back {
    [self.paintView back];
}

/**
 点击清屏按钮
 */
- (IBAction)clean {
    [self.paintView clean];
}

/**
 点击保存按钮
 */
- (IBAction)save {
    
}

/**
 点击颜色按钮

 @param sender 按钮本身
 */
- (IBAction)coclorBtnClick:(UIButton *)sender {
    self.paintView.color = sender.backgroundColor;
}

/**
 滑动滑块改变线宽
 */
- (IBAction)fontSizeSliderChange:(UISlider *)sender {
    self.paintView.width = sender.value;
    [self.paintView changeLineWidth];
}


@end

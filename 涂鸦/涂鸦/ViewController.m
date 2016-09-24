//
//  ViewController.m
//  涂鸦
//
//  Created by 123 on 16/9/23.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"
#import "SYPaintView.h"
#import "UIImage+SY.h"

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
    UIImage *captureImg = [UIImage captureImage:self.paintView];
    NSData *imgData = UIImagePNGRepresentation(captureImg);
    [imgData writeToFile:@"/Users/jason/Desktop/capture.png" atomically:YES];
}

/**
 点击颜色按钮
 */
- (IBAction)coclorBtnClick:(UIButton *)sender {
    self.paintView.currentColor = sender.backgroundColor;
}

/**
 滑动滑块改变线宽
 */
- (IBAction)fontSizeSliderChange:(UISlider *)sender {
    self.paintView.width = sender.value;
    [self.paintView changeLineWidth];
}

@end

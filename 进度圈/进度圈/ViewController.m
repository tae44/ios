//
//  ViewController.m
//  进度圈
//
//  Created by jason on 16/9/19.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"
#import "SYProgress.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet SYProgress *progressView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)changeSlider:(UISlider *)sender {
    self.progressView.progress = sender.value;
}

@end

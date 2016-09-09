//
//  ViewController.m
//  滑块考试
//
//  Created by 123 on 16/9/5.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"
#import "SYFontView.h"

@interface ViewController () <SYFontViewDelegate> //1 遵守代理协议

@property (nonatomic, strong) SYFontView *fontView;

@property (weak, nonatomic) IBOutlet UILabel *textView;

@end

@implementation ViewController

//懒加载
- (SYFontView *)fontView {
    if (!_fontView) {
        _fontView = [SYFontView fontView];
    }
    return _fontView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    SYFontView *fontView = self.fontView;
    //设置代理为自己
    fontView.delegate = self;
    [self.view addSubview:self.fontView];
}

//3 实现代理方法
- (void)fontViewChangedFontSize:(SYFontView *)fontView {
    self.textView.font = [UIFont systemFontOfSize:fontView.sliderView.value];
}

- (void)fontViewDidClickedBtn:(SYFontView *)fontView {
    self.textView.font = [UIFont systemFontOfSize:fontView.fontSize];
}

@end

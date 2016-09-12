//
//  ViewController.m
//  02.国旗选择
//
//  Created by Apple on 14/12/26.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "ViewController.h"
#import "FlagView.h"
#import "Flag.h"

@interface ViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic,strong) NSArray *flags;

@end

@implementation ViewController

-(NSArray *)flags{
    if (!_flags) {
        _flags = [Flag flagList];
    }
    return _flags;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.flags.count;
}

#pragma mark 自定义Pickerview的行

#warning UIPikcerView循环引用在ios7以后，不太明显，但是确实还是会循环引用，在ios6,view的循环引用是非常明显
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{

    //可以不设置frm,系统会设置frm
//    UILabel *label =[[UILabel alloc] init];
//    label.backgroundColor = [UIColor yellowColor];
//    label.text = @"xx";
    
    //如果有重用的view,会传一个view进来
    FlagView *flagView = (FlagView *)view;
    
    if (!flagView) {
        flagView = [FlagView flagView];
#warning 一般设置自定义的view大小时，不直接设置bounds/frame
        //自定义控件要添加bounds
        //设置高度无效
        flagView.bounds = CGRectMake(0, 0, 200, 0);
    }

    Flag *flag = self.flags[row];
    flagView.flag = flag;
    return flagView;
}

#pragma mark 高度
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 50;
}

#pragma mark 宽度
//-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
//    //return 200;
//}

@end

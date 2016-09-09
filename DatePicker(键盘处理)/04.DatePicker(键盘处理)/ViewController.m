//
//  ViewController.m
//  04.DatePicker(键盘处理)
//
//  Created by Apple on 14/12/26.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "ViewController.h"
#import "CZKeyboardToolbar.h"

@interface ViewController ()<CZKeyboardToolbarDelegate>

@property (strong, nonatomic) UIDatePicker *datepicker;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建datapikcer
    self.datepicker = [[UIDatePicker alloc] init];
    
    //本地方
    self.datepicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh"];
    
    //日期控件格式
    self.datepicker.datePickerMode = UIDatePickerModeDate;
    
    //设置textfield的键盘
    self.textField.inputView = self.datepicker;
    
    //创建toolbar
    CZKeyboardToolbar *toolbar = [CZKeyboardToolbar toolbar];
    
    //设置键盘的代理
    toolbar.kbDelegate = self;
    
    //设置textfield的辅助工具条
    self.textField.inputAccessoryView = toolbar;
}

#pragma mark 自定义键盘工具条的代理方法
-(void)keyboardToolbar:(CZKeyboardToolbar *)toolbar btndidSelected:(UIBarButtonItem *)item{
    if (item.tag == 2) {//Done按钮点击
        //获取日期显示在textField
        NSDate *date = self.datepicker.date;
        //日期转字符串
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        //设置日期格式
        dateFormatter.dateFormat = @"yyyyMMdd";
        NSString *dateStr =  [dateFormatter stringFromDate:date];
        self.textField.text = dateStr;
    }
}

/**
 *  代码创建的toolbar
 */
-(void)codeForToolbar{
    //代码创建UIToolbar
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    toolbar.backgroundColor = [UIColor grayColor];
    //屏幕宽度
    CGFloat screenW = [[UIScreen mainScreen] bounds].size.width;
    toolbar.bounds = CGRectMake(0, 0, screenW, 44);
    //添加各种item按钮
    UIBarButtonItem *previousBtn = [[UIBarButtonItem alloc] initWithTitle:@"上一个" style:UIBarButtonItemStylePlain target:nil action:nil];
    UIBarButtonItem *nextBtn = [[UIBarButtonItem alloc] initWithTitle:@"下一个" style:UIBarButtonItemStylePlain target:nil action:nil];
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:nil action:nil];
    //固定长度的按钮
    UIBarButtonItem *fixedBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    //代码实现要设置宽度
    fixedBtn.width = 10;
    //可拉伸的按钮
    UIBarButtonItem *flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    //添加UIToolbar里面的按钮
    toolbar.items = @[previousBtn,fixedBtn,nextBtn,flexible,doneBtn];
}

@end

//
//  ViewController.m
//  01.点菜系统
//
//  Created by Apple on 14/12/26.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic,strong)NSArray *foods;
@property (weak, nonatomic) IBOutlet UILabel *fruitLabel;
@property (weak, nonatomic) IBOutlet UILabel *mainFoodLabel;
@property (weak, nonatomic) IBOutlet UILabel *drinkLabel;

- (IBAction)randomMenu;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@end

@implementation ViewController

-(NSArray *)foods{
    if (!_foods) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"foods.plist" ofType:nil];
        _foods = [NSArray arrayWithContentsOfFile:filePath];
    }
    return _foods;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSInteger columns = self.foods.count;
    for (int i = 0; i < columns; i++) {
        [self pickerView:nil didSelectRow:0 inComponent:i];
    }
}

#pragma mark UIPickerView数据源

#pragma mark 列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return self.foods.count;
}

#pragma mark 每一列的行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    //获取每一列的数据
    NSArray *items = self.foods[component];
    //返回每一列的个数据
    return items.count;
}

#pragma mark UIPickerView代理
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    //获取每一列的数据
    NSArray *items = self.foods[component];
    //返回对应列的行的数据
    return items[row];
}

#pragma mark pickerView的选中
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    //获取数据
    NSArray *items = self.foods[component];
    NSString *rowStr = items[row];
    //更改数据
    switch (component) {
        case 0://水果
            self.fruitLabel.text = rowStr;
            break;
        case 1://主食
            self.mainFoodLabel.text = rowStr;
            break;
        case 2://饮料
            self.drinkLabel.text = rowStr;
            break;
        default:
            break;
    }
}

#pragma mark 随机菜单，由天决定我们吃什么
- (IBAction)randomMenu {
    // 1.获取每列有多少行
    NSInteger columns = self.foods.count;
    for (int i = 0; i < columns; i ++) {
        NSArray *items = self.foods[i];
        //对应列的行数
        NSInteger rowsInColumn = items.count;
        // 2.在行范围产生随机数据
        NSInteger randomRow =arc4random_uniform((int)rowsInColumn);
        //每列的随机行数不能与之前一样
        // 获取旧的行数
        NSInteger oldRow = [self.pickerView selectedRowInComponent:i];
        while (oldRow == randomRow ) {
            randomRow =arc4random_uniform((int)rowsInColumn);
        }
        // 0.0~0.9
        //arc4random_uniform(10) * 0.1
        
        // 0.00~0.99
        //arc4random_uniform(100) * 0.01
        
        // 3.更改数据
        // 3.1 更改label的数据
        [self pickerView:nil didSelectRow:randomRow inComponent:i];
#warning 要改变PIckerview选中的行，要使用pickerview的一个方法
        // 3.1 更改UIPickerView选中的数据
        [self.pickerView selectRow:randomRow inComponent:i animated:YES];
    }
}

@end

//
//  ViewController.m
//  freight
//
//  Created by 123 on 16/8/26.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"
#import "SYItem.h"

@interface ViewController ()

@property (nonatomic , strong) NSMutableArray *items;
/**名称输入框*/
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
/**数量输入框*/
@property (weak, nonatomic) IBOutlet UITextField *countTextField;
/**价格输入框*/
@property (weak, nonatomic) IBOutlet UITextField *priceTextField;
/**重量输入框*/
@property (weak, nonatomic) IBOutlet UITextField *weightTextField;
/**总数量标签*/
@property (weak, nonatomic) IBOutlet UILabel *totalItemCountLabel;
/**总价值标签*/
@property (weak, nonatomic) IBOutlet UILabel *totalPriceLabel;

- (IBAction)addItemToPlist;

- (IBAction)clickDetailedBtn;

@end

@implementation ViewController

- (NSMutableArray *)items {
    if (!_items) {
        _items = [SYItem itemList];
    }
    return _items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

/**
 *  点击controller的时候执行此方法
 *
 *  @param touches touches description
 *  @param event   event description
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

/**
 *  计算总价值
 *
 *  @return totalPrice
 */
- (float)calucateTotalPrice {
    float total = 0;
    for (SYItem *item in self.items) {
        total += item.price.floatValue;
    }
    return total;
}

/**
 *  将输入的数据转化为数据数组
 */
- (IBAction)addItemToPlist {
    NSMutableDictionary *itemDictonary = [NSMutableDictionary dictionary];
    itemDictonary[@"name"] = self.nameTextField.text;
    itemDictonary[@"price"] = self.priceTextField.text;
    itemDictonary[@"count"] = self.countTextField.text;
    itemDictonary[@"weight"] = self.weightTextField.text;
    SYItem *item = [SYItem itemWithDic:itemDictonary];
    [self.items addObject:item];
    self.totalItemCountLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)self.items.count];
    self.totalPriceLabel.text = [NSString stringWithFormat:@"%.2f", [self calucateTotalPrice]];
}

- (IBAction)clickDetailedBtn {
    
}

@end

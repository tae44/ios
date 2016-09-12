//
//  ViewController.m
//  汽车品牌2
//
//  Created by 123 on 16/8/29.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"
#import "SYCar.h"
#import "SYCarGroups.h"

@interface ViewController () <UITableViewDataSource>

@property (nonatomic, strong) NSArray *carGroups;

@end

@implementation ViewController

-(BOOL)prefersStatusBarHidden {
    return YES;
}

-(NSArray *)carGroups {
    if (_carGroups == nil) {
        _carGroups = [SYCarGroups carList];
    }
    return _carGroups;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.carGroups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    SYCarGroups *carGroups = self.carGroups[section];
    return carGroups.cars.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseID = @"car";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    }
    SYCarGroups *carGroups = self.carGroups[indexPath.section];
    SYCar *car = carGroups.cars[indexPath.row];
    cell.textLabel.text = car.name;
    cell.imageView.image = [UIImage imageNamed:car.icon];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    SYCarGroups *carGroups = self.carGroups[section];
    return carGroups.title;
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return [self.carGroups valueForKeyPath:@"title"];
//    NSMutableArray * arr = [NSMutableArray array];
//    for (int i = 0; i < self.carGroups.count; i++) {
//        [arr addObject:[self.carGroups[i] title]];
//    }
//    return arr;
}

@end

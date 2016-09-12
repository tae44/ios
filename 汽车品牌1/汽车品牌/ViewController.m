//
//  ViewController.m
//  汽车品牌
//
//  Created by 123 on 16/8/29.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"
#import "SYcarGroups.h"

@interface ViewController () <UITableViewDataSource>

@property (nonatomic, strong) NSArray *carGroups;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (BOOL) prefersStatusBarHidden {
    return YES;
}

-(NSArray *) carGroups {
    if (_carGroups == nil) {
        _carGroups = [SYcarGroups carGroupsList];
    }
    return _carGroups;
}

- (void) viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
}

#pragma mark - 数据源方法

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return self.carGroups.count;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    SYcarGroups *carGroups = self.carGroups[section];
    return carGroups.cars.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SYcarGroups *carGroups = self.carGroups[indexPath.section];
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = carGroups.cars[indexPath.row];
    return cell;
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    SYcarGroups *carGroups = self.carGroups[section];
    return carGroups.title;
}

- (NSString *) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    SYcarGroups *carGroups = self.carGroups[section];
    return carGroups.desc;
}

@end

//
//  SYDetailedTableViewController.m
//  freight
//
//  Created by 123 on 16/9/3.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYDetailedTableViewController.h"
#import "SYItem.h"

@implementation SYDetailedTableViewController

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseID = @"item";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    }
    SYItem *item = self.items[indexPath.row];
    cell.textLabel.text = item.name;
    return cell;
}

@end

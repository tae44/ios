//
//  ViewController.m
//  LOL
//
//  Created by 123 on 16/8/29.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"
#import "SYHeros.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSArray *heros;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (BOOL) prefersStatusBarHidden {
    return YES;
}

- (NSArray *) heros {
    if (_heros == nil) {
        _heros = [SYHeros heroList];
    }
    return _heros;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //连线方式设置数据源及代理
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 10, 0, 10);
    self.tableView.separatorColor = [UIColor redColor];
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    self.tableView.tableHeaderView = [UIButton buttonWithType:UIButtonTypeContactAdd];
//    self.tableView.backgroundColor = [UIColor yellowColor];
}

#pragma mark - 数据源方法

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.heros.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SYHeros *hero = self.heros[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"hero"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"hero"];
    }
    cell.textLabel.text = hero.name;
    cell.detailTextLabel.text = hero.intro;
    cell.imageView.image = [UIImage imageNamed:hero.icon];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    cell.detailTextLabel.numberOfLines = 0;
    return cell;
}

#pragma mark - tableView的代理方法

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.row % 2) {
//        return 60;
//    }
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SYHeros *hero = self.heros[indexPath.row];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入英雄的新名字" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:defaultAction];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.text = hero.name;
        textField.tag = indexPath.row;
    }];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UITextField *t = alert.textFields.firstObject;
        hero.name = t.text;
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:alert.textFields.firstObject.tag inSection:0];
        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
//        [self.tableView reloadData];
    }];
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}

@end

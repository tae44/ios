//
//  CZSettingViewController.m
//  NetEaseLotterry
//
//  Created by Vincent_Guo on 14-9-2.
//  Copyright (c) 2014年 vgios. All rights reserved.
//



#import "CZBaseSettingController.h"
#import "CZSettingCell.h"


@interface CZBaseSettingController ()



@end

@implementation CZBaseSettingController

-(id)init{
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    return [super initWithStyle:UITableViewStyleGrouped];
}

-(NSMutableArray *)data{
    if (_data == nil) {
        _data = [NSMutableArray array];
    }
    
    return _data;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.backgroundView = nil;
    //self.tableView.backgroundColor = CZBgColor;
    
    //self.tableView.backgroundColor = [UIColor purpleColor];
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]];
    

    self.tableView.sectionFooterHeight = 0;
    self.tableView.sectionHeaderHeight = 18;
    
    if (iOS7) {
       self.tableView.contentInset = UIEdgeInsetsMake(18, 0, 0, 0);
    }
}



#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    CZSettingGroup *group = self.data[section];
    return group.items.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //自定义cell
    CZSettingCell *cell = [CZSettingCell settingCellWithTableView:tableView];
    
    CZSettingGroup *group = self.data[indexPath.section];
    CZSettingItem *item = group.items[indexPath.row];
    
    //判断是否处于组的最后一行，如果，最后一行，不显示分隔线
    cell.lastRowInSection = (group.items.count == indexPath.row + 1);
    cell.item = item;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //获取item
    CZSettingGroup *group = self.data[indexPath.section];
    CZSettingItem *item = group.items[indexPath.row];
    
    
    //有特殊操作
    if (item.option) {
        item.option();
    }else{
        if ([item isKindOfClass:[CZSettingArrowItem class]]
            && item.vcClass != nil) {
            //创建控制器
            UIViewController *vc =  [[item.vcClass alloc] init];
            vc.title = item.title;
            //打开控制器View
            [self.navigationController pushViewController:vc animated:YES];

        }
        
    }
    
   
    
}


-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    CZSettingGroup *group = self.data[section];
    return group.footerTitle;

}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    CZSettingGroup *group = self.data[section];
    return group.headerTitle;
}


-(void)showAlertWithMsg:(NSString *)msg{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提醒" message:msg delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
    [alert show];
}

@end

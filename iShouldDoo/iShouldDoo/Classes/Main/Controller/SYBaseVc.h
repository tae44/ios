//
//  SYBaseVc.h
//  iShouldDoo
//
//  Created by jason on 2016/10/13.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SYMission.h"
#import "SYPreview.h"
#import "SYEditViewController.h"

@interface SYBaseVc : UITableViewController
/**通用数组*/
@property (nonatomic, strong) NSMutableArray *currency;
/**存储任务列表的数组*/
@property (nonatomic, strong) NSMutableArray *todoList;
/**存储已完成任务列表的数组*/
@property (nonatomic, strong) NSMutableArray *doneList;
/**存储已删除任务列表的数组*/
@property (nonatomic, strong) NSMutableArray *deleteList;
/**选中某一行的行号*/
@property (nonatomic, assign) NSInteger row;
/**存放未完成任务的沙盒路径*/
@property (nonatomic, copy) NSString *documentPathWithTodo;
/**存放已完成任务的沙盒路径*/
@property (nonatomic, copy) NSString *documentPathWithDone;
/**存放已删除任务的沙盒路径*/
@property (nonatomic, copy) NSString *documentPathWithDelete;
/**预览窗口*/
@property (nonatomic, strong) SYPreview *preview;

@end

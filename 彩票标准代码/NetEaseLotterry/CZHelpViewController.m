//
//  CZHelpViewController.m
//  NetEaseLotterry
//
//  Created by Vincent_Guo on 14-9-4.
//  Copyright (c) 2014年 vgios. All rights reserved.
//

#import "CZHelpViewController.h"
#import "CZHtmlViewController.h"
#import "CZHtmlPage.h"

@interface CZHelpViewController ()
@property(nonatomic,strong)NSArray *htmls;

@end

@implementation CZHelpViewController


-(NSArray *)htmls{
    if (_htmls == nil) {
        
        NSString *path =[[NSBundle mainBundle] pathForResource:@"help" ofType:@"json"];
        
        //data
        NSData *data = [NSData dataWithContentsOfFile:path];
        
        NSArray *htmlData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        NSMutableArray *htmlsM = [NSMutableArray array];
        for (NSDictionary *dict in htmlData) {
            CZHtmlPage *html = [CZHtmlPage htmlPageWithDict:dict];
            [htmlsM addObject:html];
        }
        
        _htmls = htmlsM;
    }
    
    return _htmls;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"%@",self.htmls);
    
    CZSettingGroup *group = [[CZSettingGroup alloc] init];
    
    NSMutableArray *itemsM = [NSMutableArray array];
    for (CZHtmlPage *page in self.htmls) {
        CZSettingArrowItem *item = [CZSettingArrowItem settingItemWithIcon:nil title:page.title vcClass:[CZHtmlViewController class] ];
        [itemsM addObject:item];
    }
    
    group.items = itemsM;
    
    [self.data addObject:group];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CZSettingGroup *group = self.data[indexPath.section];
    CZSettingArrowItem *item = group.items[indexPath.row];
    
    
    
    CZHtmlViewController *htmlVc = [[item.vcClass alloc] init];
    htmlVc.htmlPage = self.htmls[indexPath.row];
    
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:htmlVc];
    
    [self presentViewController:nav animated:YES completion:nil];
    
}

@end

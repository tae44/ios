//
//  SYHelpViewController.m
//  彩票
//
//  Created by jason on 2016/10/10.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYHelpViewController.h"
#import "SYHtmlPage.h"
#import "SYSettingGroup.h"
#import "SYSettingArrowItem.h"
#import "SYWebViewController.h"

@interface SYHelpViewController ()
/**所有页面信息,存储SYHtmlPage对象*/
@property (nonatomic, strong) NSArray *htmls;

@end

@implementation SYHelpViewController

- (NSArray *)htmls {
    if (!_htmls) {
        // 从json获取数据
        // 获取json路径
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"help.json" ofType:nil];
        // 把json转换为NSData
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        // 把NSData转换为数组 json的序列化就是把数据转成字典/数组
        NSArray *helpArr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        // 遍历数组里字典,转成模型
        NSMutableArray *tmpHtml = [NSMutableArray array];
        for (NSDictionary *dict in helpArr) {
            SYHtmlPage *htmlPage = [SYHtmlPage htmlPageWithDict:dict];
            [tmpHtml addObject:htmlPage];
        }
        _htmls = tmpHtml;
    }
    return _htmls;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 把htmls的数据转成cellData显示的数据
    SYSettingGroup *group = [[SYSettingGroup alloc] init];
    NSMutableArray *items = [NSMutableArray array];
    for (SYHtmlPage *htmlPage in self.htmls) {
        SYSettingArrowItem *item = [SYSettingArrowItem itemWithIcon:nil title:htmlPage.title];
        [items addObject:item];
    }
    group.items = items;
    [self.cellData addObject:group];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 如果要在应用里显示的网页,使用一个叫UIWebView控件,这个控制就能显示网页
    // 创建一个导航控制器,设置它的子控制器为"网页的控制器"
    SYWebViewController *webVc = [[SYWebViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:webVc];
    // 设置模型数据
    webVc.htmlPage = self.htmls[indexPath.row];
    // 以模态窗口方式打开控制器
    [self presentViewController:nav animated:YES completion:nil];
}

@end

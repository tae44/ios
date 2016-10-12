//
//  SYWebViewController.m
//  彩票
//
//  Created by jason on 2016/10/10.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYWebViewController.h"
#import "SYHtmlPage.h"

@interface SYWebViewController () <UIWebViewDelegate>

@property (nonatomic, weak) UIWebView *webView;

@end

@implementation SYWebViewController

- (void)loadView {
    UIWebView *webView = [[UIWebView alloc] init];
    self.view = webView;
    self.webView = webView;
    self.webView.delegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.htmlPage.title;
    // 设置背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    // 给个返回按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(btnClick)];
    // 加载远程的网站
    // NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    // 加载本地的网页信息
    NSURL *url = [[NSBundle mainBundle] URLForResource:self.htmlPage.html withExtension:nil];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    // 加载一个请求
    [self.webView loadRequest:request];
}

//网页加载完成
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    if (self.htmlPage.ID) {
        // 执行javascript
        NSString *javascript = [NSString stringWithFormat:@"window.location.href = '#%@'", self.htmlPage.ID];
        [webView stringByEvaluatingJavaScriptFromString:javascript];
    }
}

- (void)btnClick {
    // 使用模态方式隐藏窗口
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

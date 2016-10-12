//
//  CZHtmlViewController.m
//  NetEaseLotterry
//
//  Created by Vincent_Guo on 14-9-4.
//  Copyright (c) 2014年 vgios. All rights reserved.
//

#import "CZHtmlViewController.h"
#import "CZHtmlPage.h"

@interface CZHtmlViewController ()<UIWebViewDelegate>{
    UIWebView *_webView;
}

@end

@implementation CZHtmlViewController


-(void)loadView{
    _webView = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _webView.delegate = self;
    self.view = _webView;
    
    //获取路径
    NSString *path = [[NSBundle mainBundle] pathForResource:self.htmlPage.html ofType:nil];
    
    //请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]];
    
    
    //加载页面
    [_webView loadRequest:request];
   
}


-(void)back{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.htmlPage.title;
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:self action:@selector(back)];
}


-(void)webViewDidFinishLoad:(UIWebView *)webView{
    NSString *js = [NSString stringWithFormat:@"window.location.href='#%@'",self.htmlPage.ID];
    [webView stringByEvaluatingJavaScriptFromString:js];
}

@end

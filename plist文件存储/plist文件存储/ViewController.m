//
//  ViewController.m
//  plist文件存储
//
//  Created by jason on 16/9/14.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, copy) NSString *plistPath;

@end

@implementation ViewController

- (NSString *)plistPath {
    if (!_plistPath) {
        //获取沙盒中的Document路径
        NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        //路径后面加上具体文件名称
        _plistPath = [doc stringByAppendingPathComponent:@"data.plist"];
    }
    return _plistPath;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //查看沙盒的路径
    //1.控制台打印沙盒的路径,使用finder - 前往文件夹
    //2.控制台打印沙盒的路径,打开终端 open + 路径
    //3.使用simpholders工具
    //4.可以断点 输入po NSHomeDirectory()
    
    //获取缓存路径
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSLog(@"%@", cachePath);
    
    //获取临时路径
    NSString *tmpPath = NSTemporaryDirectory();
    NSLog(@"%@", tmpPath);
    
    //获取主目录路径
    NSString *homePath = NSHomeDirectory();
    NSLog(@"%@", homePath);
}

- (void)testArray {
    NSArray *data = @[@"asd", @"aaa"];
    //将数据写入plist文件
    [data writeToFile:self.plistPath atomically:YES];
    //读取
    NSArray *array = [NSArray arrayWithContentsOfFile:self.plistPath];
    NSLog(@"%@", array);
}

- (void)testDictionary {
    NSDictionary *data = @{@"name":@"jason", @"age":@18};
    [data writeToFile:self.plistPath atomically:YES];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:self.plistPath];
    NSLog(@"%@", dict);
}

- (void)testString {
    NSString *data = @"jason";
    [data writeToFile:self.plistPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    NSString *str = [NSString stringWithContentsOfFile:self.plistPath encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@", str);
}

@end

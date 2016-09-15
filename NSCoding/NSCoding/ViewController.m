//
//  ViewController.m
//  NSCoding
//
//  Created by jason on 16/9/15.
//  Copyright © 2016年 jason. All rights reserved.
//

/**
 *  NSKeyedArchiver   保存数据
 *  NSKeyedUnarchiver 读取数据
 */

#import "ViewController.h"
#import "SYContact.h"

@interface ViewController ()

- (IBAction)saveData;

- (IBAction)readData;

@property (nonatomic, copy) NSString *plistPath;

@end

@implementation ViewController

- (NSString *)plistPath {
    if (!_plistPath) {
        NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        _plistPath = [doc stringByAppendingPathComponent:@"data.archiver"];
    }
    return _plistPath;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testArray];
    NSArray *array = [NSKeyedUnarchiver unarchiveObjectWithFile:self.plistPath];
    NSLog(@"%@", array);
//    [self testDict];
//    NSDictionary *dict = [NSKeyedUnarchiver unarchiveObjectWithFile:self.plistPath];
//    NSLog(@"%@", dict);
}

- (IBAction)saveData {
    SYContact *contact = [[SYContact alloc] init];
    contact.name = @"Jason";
    contact.age = 30;
    contact.tel = @"110";
    [NSKeyedArchiver archiveRootObject:contact toFile:self.plistPath];
}

- (IBAction)readData {
    SYContact *contact = [NSKeyedUnarchiver unarchiveObjectWithFile:self.plistPath];
    NSLog(@"name:%@ age:%d tel:%@ ",contact.name,contact.age,contact.tel);
}

/**
 *  测试系统的NSDictionary NSArray的归档
 *  只有对象遵守了NSCoding协议才可以使用NSKeyedArchiver进行数据存储
 */
- (void)testDict {
    //使用"归档"方法保存数据
    NSDictionary *data = @{@"name":@"jason", @"height":@1.80};
    //直接把一个对象保存到沙盒里
    [NSKeyedArchiver archiveRootObject:data toFile:self.plistPath];
}

- (void)testArray {
    NSArray *data = @[@"abc", @"bbb"];
    [NSKeyedArchiver archiveRootObject:data toFile:self.plistPath];
}

@end

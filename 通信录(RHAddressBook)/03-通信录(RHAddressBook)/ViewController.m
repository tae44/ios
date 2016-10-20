//
//  ViewController.m
//  03-通信录(RHAddressBook)
//
//  Created by apple on 15/2/3.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ViewController.h"
#import <RHAddressBook/AddressBook.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 1.获取授权状态
    RHAuthorizationStatus status = [RHAddressBook authorizationStatus];
    
    // 2.判断如果是未决定状态
    if (status != RHAuthorizationStatusAuthorized) return;
    
    // 3.获取通信录对象
    RHAddressBook *addressBook = [[RHAddressBook alloc] init];
    
    // 4.获取所有的联系人记录
    NSArray *peopleArray = addressBook.people;
    for (RHPerson *person in peopleArray) {
        
        // 4.1.获取用户的姓名
        NSString *firstName = person.firstName;
        NSString *lastName = person.lastName;
        NSLog(@"%@--%@", firstName, lastName);
        
        // 4.2.获取电话号码
        RHMultiValue *phones = person.phoneNumbers;
        for (int i = 0; i < phones.count; i++) {
            NSString *phoneLabel = [phones labelAtIndex:i];
            NSString *phoneValue = [phones valueAtIndex:i];
            NSLog(@"%@--%@", phoneLabel, phoneValue);
        }
    }
}

@end

//
//  ViewController.m
//  01-通信录(有界面)
//
//  Created by apple on 15/2/3.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ViewController.h"
#import <AddressBookUI/AddressBookUI.h>

@interface ViewController () <ABPeoplePickerNavigationControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 1.用户联系人选择控制器ABPeoplePickerNavigationController
    ABPeoplePickerNavigationController *ppnc = [[ABPeoplePickerNavigationController alloc] init];
    
    // 2.设置代理
    ppnc.peoplePickerDelegate = self;
    
    // 2.展示控制器
    [self presentViewController:ppnc animated:YES completion:nil];
}

#pragma mark - ABPeoplePickerNavigationController的代理方法
/**
 *  选中某一个联系人的时候会调用该方法
 *
 *  @param person       选中的联系人
 */
-(void)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker didSelectPerson:(ABRecordRef)person
{
    // 1.获取联系人的姓名
    CFStringRef firstName = ABRecordCopyValue(person, kABPersonFirstNameProperty);
    CFStringRef lastName = ABRecordCopyValue(person, kABPersonLastNameProperty);
    /*
     __bridge NSString * : 将对象所有权给Foundation框架一份,但是本身并没有释放
     __bridge_transfer NSString * : 将对象所有权交给Foundation框架,并且自身释放掉对象
     */
    NSString *first = (__bridge_transfer NSString *)(firstName);
    NSString *last = (__bridge NSString *)(lastName);
    NSLog(@"%@----%@", first, last);
    CFRelease(lastName);
    
    // 2.获取联系人的电话号码
    ABMultiValueRef phones = ABRecordCopyValue(person, kABPersonPhoneProperty);
    CFIndex phoneCount = ABMultiValueGetCount(phones);
    for (CFIndex i = 0; i < phoneCount; i++) {
        NSString *phoneLabel = CFBridgingRelease(ABMultiValueCopyLabelAtIndex(phones, i));
        NSString *phoneValue = CFBridgingRelease(ABMultiValueCopyValueAtIndex(phones, i));
        NSLog(@"%@--%@", phoneLabel, phoneValue);
    }
    
    // 3.释放需要释放的对象
    CFRelease(phones);
}
/**
 *  选中某一个联系人的某一个属性的时候会调用该方法
 *
 *  @param person       选中的联系人
 *  @param property     选中的属性
 *  @param identifier   属性对应的标识
 */
- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker didSelectPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier
{
    NSLog(@"%s", __func__);
}

@end

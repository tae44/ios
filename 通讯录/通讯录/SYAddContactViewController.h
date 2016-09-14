//
//  SYAddContactViewController.h
//  通讯录
//
//  Created by 123 on 16/9/14.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SYAddContactViewController,SYContact;

@protocol SYAddContactViewControllerDelegate <NSObject>

@optional

/**
 *  直接返回一个联系人模型
 */
- (void)addContactViewController:(SYAddContactViewController *)addContactVc didSaveContact:(SYContact *)contact;

@end

@interface SYAddContactViewController : UIViewController

@property (nonatomic, weak) id<SYAddContactViewControllerDelegate> delegate;

@end

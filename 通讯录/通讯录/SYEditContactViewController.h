//
//  SYEditContactViewController.h
//  通讯录
//
//  Created by jason on 16/9/14.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SYContact,SYEditContactViewController;

@protocol SYEditContactViewControllerDelegate <NSObject>

@optional
- (void)SYEditContactViewController:(SYEditContactViewController *)editContactVc didFinishedSaveContact:(SYContact *)contact;

@end

@interface SYEditContactViewController : UIViewController

@property (nonatomic, strong) SYContact *contact;

@property (nonatomic, weak) id<SYEditContactViewControllerDelegate> delegate;

@end

//
//  CZMessageFrame.h
//  A01-QQ聊天列表
//
//  Created by Apple on 14/12/21.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#define CZFontSize 15

#import <UIKit/UIKit.h>

@class CZMessage;
@interface CZMessageFrame : NSObject

@property (nonatomic, assign, readonly) CGRect timeFrame;
@property (nonatomic, assign, readonly) CGRect iconFrame;
@property (nonatomic, assign, readonly) CGRect textFrame;

@property (nonatomic, assign, readonly) CGFloat rowHeight;

@property (nonatomic, strong) CZMessage *message;

@end

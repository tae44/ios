//
//  SYContact.h
//  通讯录
//
//  Created by 123 on 16/9/14.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SYContact : NSObject <NSCoding>

@property (nonatomic , copy) NSString *name;

@property (nonatomic , copy) NSString *tel;

@end

//
//  CZSettingGroup.h
//  NetEaseLotterry
//
//  Created by Vincent_Guo on 14-9-3.
//  Copyright (c) 2014年 vgios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CZSettingGroup : NSObject

@property(nonatomic,copy)NSString *headerTitle;
@property(nonatomic,copy)NSString *footerTitle;

@property(nonatomic,strong)NSArray *items;




@end

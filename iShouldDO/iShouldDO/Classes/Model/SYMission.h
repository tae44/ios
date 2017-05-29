//
//  SYMission.h
//  iShouldDO
//
//  Created by jason on 2016/9/26.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SYMission : NSObject <NSCoding>
/**任务名称*/
@property (nonatomic, copy) NSString *name;
/**任务备注*/
@property (nonatomic, copy) NSString *comment;
/**显示的日期时间*/
@property (nonatomic, copy) NSString *date;

@end

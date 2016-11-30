//
//  SYWord.h
//  听书(歌词同步)
//
//  Created by jason on 2016/11/10.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SYWord : NSObject
/**诗句*/
@property (nonatomic, strong) NSString *text;
/**开始的时间*/
@property (nonatomic, assign) double time;

@end

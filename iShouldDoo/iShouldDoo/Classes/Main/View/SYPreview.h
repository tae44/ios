//
//  SYPreview.h
//  iShouldDO
//
//  Created by jason on 2016/9/29.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SYPreview,SYMission;

@protocol SYPreviewDelegate <NSObject>

@optional
- (void)preview:(SYPreview *)preview;

@end

@interface SYPreview : UIView

/**任务模型*/
@property (nonatomic, strong) SYMission *mission;

@property (nonatomic, weak) id<SYPreviewDelegate> delegate;

+ (instancetype)preview;

@end

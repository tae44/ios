//
//  SYPerson.h
//  easyRPG
//
//  Created by 123 on 16/8/27.
//  Copyright © 2016年 jason. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SYEnemy;

@interface SYPerson : NSObject

//攻击力
@property (nonatomic , assign) int attack;

//防御力
@property (nonatomic , assign) int guard;

//血量
@property (nonatomic , assign) int life;

- initWithAttack:(int) attack andGuard:(int) guard andLife:(int) life;

- (void) attackTo:(SYEnemy *) enemy;

@end

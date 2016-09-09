//
//  SYPerson.m
//  easyRPG
//
//  Created by 123 on 16/8/27.
//  Copyright © 2016年 jason. All rights reserved.
//

#import "SYPerson.h"
#import "SYEnemy.h"

@implementation SYPerson

- initWithAttack:(int) attack andGuard:(int) guard andLife:(int) life {
    if (self = [super init]) {
        self.attack = attack;
        self.guard = guard;
        self.life = life;
    }
    return self;
}

- (void) attackTo:(SYEnemy *) enemy {
    enemy.life -= self.attack;
}

@end

//
//  NSTimer+DBBlock.m
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/5.
//  Copyright © 2019年 DB. All rights reserved.
//

#import "NSTimer+DBBlock.h"

@implementation NSTimer (DBBlock)

+ (id)db_scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)(void))inBlock repeats:(BOOL)inRepeats
{
    void (^block)(void) = [inBlock copy];
    id ret = [self scheduledTimerWithTimeInterval:inTimeInterval target:self selector:@selector(db_jdExecuteSimpleBlock:) userInfo:block repeats:inRepeats];
    return ret;
}

+ (id)db_timerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)(void))inBlock repeats:(BOOL)inRepeats
{
    void (^block)(void) = [inBlock copy];
    id ret = [self timerWithTimeInterval:inTimeInterval target:self selector:@selector(db_jdExecuteSimpleBlock:) userInfo:block repeats:inRepeats];
    return ret;
}

+ (void)db_jdExecuteSimpleBlock:(NSTimer *)inTimer;
{
    if([inTimer userInfo])
    {
        void (^block)(void) = (void (^)(void))[inTimer userInfo];
        block();
    }
}

@end

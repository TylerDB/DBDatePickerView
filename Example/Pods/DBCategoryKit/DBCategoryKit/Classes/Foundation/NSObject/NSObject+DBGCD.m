//
//  NSObject+DBGCD.m
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/5.
//  Copyright © 2019年 DB. All rights reserved.
//

#import "NSObject+DBGCD.h"

@implementation NSObject (DBGCD)

- (void)db_performAsynchronous:(void(^)(void))block {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, block);
}

- (void)db_performOnMainThread:(void(^)(void))block wait:(BOOL)shouldWait {
    if (shouldWait) {
        // Synchronous
        dispatch_sync(dispatch_get_main_queue(), block);
    }
    else {
        // Asynchronous
        dispatch_async(dispatch_get_main_queue(), block);
    }
}

- (void)db_performAfter:(NSTimeInterval)seconds block:(void(^)(void))block {
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, seconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), block);
}

@end

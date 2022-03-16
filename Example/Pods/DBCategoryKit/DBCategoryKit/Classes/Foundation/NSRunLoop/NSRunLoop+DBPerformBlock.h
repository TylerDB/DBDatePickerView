//
//  NSRunLoop+DBPerformBlock.h
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/3.
//  Copyright © 2019年 DB. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString *const NSRunloopTimeoutException;

@interface NSRunLoop (DBPerformBlock)

/**
 *
 *  @brief   extension of NSRunLoop for waiting.
 *
 *  @param block 回调
 */
- (void)db_performBlockAndWait:(void (^)(BOOL *finish))block;

/**
 *
 *  @brief   extension of NSRunLoop for waiting.
 *
 *  @param block 回调
 */
- (void)db_performBlockAndWait:(void (^)(BOOL *finish))block timeoutInterval:(NSTimeInterval)timeoutInterval;

@end

NS_ASSUME_NONNULL_END

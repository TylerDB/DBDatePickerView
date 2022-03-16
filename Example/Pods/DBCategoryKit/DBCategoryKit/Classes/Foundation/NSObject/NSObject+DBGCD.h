//
//  NSObject+DBGCD.h
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/5.
//  Copyright © 2019年 DB. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (DBGCD)

/**
 *  @brief  异步执行代码块
 *
 *  @param block 代码块
 */
- (void)db_performAsynchronous:(void(^)(void))block;

/**
 *  @brief  GCD主线程执行代码块
 *
 *  @param block 代码块
 *  @param wait  是否同步请求
 */
- (void)db_performOnMainThread:(void(^)(void))block wait:(BOOL)wait;

/**
 *  @brief  延迟执行代码块
 *
 *  @param seconds 延迟时间 秒
 *  @param block   代码块
 */
- (void)db_performAfter:(NSTimeInterval)seconds block:(void(^)(void))block;

@end

NS_ASSUME_NONNULL_END

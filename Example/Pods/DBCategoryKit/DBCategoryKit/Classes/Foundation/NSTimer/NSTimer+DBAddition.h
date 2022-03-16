//
//  NSTimer+DBAddition.h
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/5.
//  Copyright © 2019年 DB. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (DBAddition)

/**
 *  @brief  暂停NSTimer
 */
- (void)db_pauseTimer;

/**
 *  @brief  开始NSTimer
 */
- (void)db_resumeTimer;

/**
 *  @brief  延迟开始NSTimer
 */
- (void)db_resumeTimerAfterTimeInterval:(NSTimeInterval)interval;

@end

NS_ASSUME_NONNULL_END

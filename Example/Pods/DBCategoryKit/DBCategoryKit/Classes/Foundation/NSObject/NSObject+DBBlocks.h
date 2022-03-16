//
//  NSObject+DBBlocks.h
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/5.
//  Copyright © 2019年 DB. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (DBBlocks)

+ (id)db_performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay;
+ (id)db_performBlock:(void (^)(id arg))block withObject:(id)anObject afterDelay:(NSTimeInterval)delay;
- (id)db_performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay;
- (id)db_performBlock:(void (^)(id arg))block withObject:(id)anObject afterDelay:(NSTimeInterval)delay;
+ (void)db_cancelBlock:(id)block;
+ (void)db_cancelPreviousPerformBlock:(id)aWrappingBlockHandle __attribute__ ((deprecated));

@end

NS_ASSUME_NONNULL_END

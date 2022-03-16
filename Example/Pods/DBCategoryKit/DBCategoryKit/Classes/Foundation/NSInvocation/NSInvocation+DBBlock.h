//
//  NSInvocation+DBBlock.h
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/3.
//  Copyright © 2019年 DB. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSInvocation (DBBlock)

+ (instancetype)db_invocationWithBlock:(id) block;

+ (instancetype)db_invocationWithBlockAndArguments:(id) block ,...;

+ (id)db_doInstanceMethodTarget:(id)target
                   selectorName:(NSString *)selectorName
                           args:(NSArray *)args;

+ (id)db_doClassMethod:(NSString *)className
          selectorName:(NSString *)selectorName
                  args:(NSArray *)args;

- (void)db_setArgumentWithObject:(id)object atIndex:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END

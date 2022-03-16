//
//  NSObject+DBKVOBlocks.h
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/5.
//  Copyright © 2019年 DB. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^DBKVOBlock)(NSDictionary *change, void *context);

@interface NSObject (DBKVOBlocks)

/**
 添加观察者与监听属性
 
 @param observer 观察者,一般为其他对象(谁想监听)
 @param keyPath 监听的属性
 @param options 监听模式
 @param context context
 @param block  监听回调
 */
- (void)db_addObserver:(NSObject *)observer
            forKeyPath:(NSString *)keyPath
               options:(NSKeyValueObservingOptions)options
               context:(void *)context
             withBlock:(DBKVOBlock)block;

/**
 移除观察者对属性的监听
 
 @param observer 观察者,一般为其他对象(谁想监听)
 @param keyPath 监听的属性
 */
- (void)db_removeBlockObserver:(NSObject *)observer
                   forKeyPath:(NSString *)keyPath;

/**
 对象本身作为观察者
 
 @param keyPath 监听的属性
 @param options 监听模式
 @param context context
 @param block 监听回调
 */
- (void)db_addObserverForKeyPath:(NSString *)keyPath
                        options:(NSKeyValueObservingOptions)options
                        context:(void *)context
                      withBlock:(DBKVOBlock)block;

/**
 移除观察者对属性的监听
 
 @param keyPath 监听的属性
 */
- (void)db_removeBlockObserverForKeyPath:(NSString *)keyPath;

@end

NS_ASSUME_NONNULL_END

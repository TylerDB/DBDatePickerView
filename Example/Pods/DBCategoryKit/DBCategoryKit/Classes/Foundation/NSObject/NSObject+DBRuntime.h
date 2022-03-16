//
//  NSObject+DBRuntime.h
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/5.
//  Copyright © 2019年 DB. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (DBRuntime)

/**
 方法交换
 
 @param originalMethod 原方法
 @param newMethod 新方法
 */
+ (void)db_swizzleMethod:(SEL)originalMethod withMethod:(SEL)newMethod;

/**
 添加方法
 
 @param newMethod 新方法
 @param klass 指定类
 */
+ (void)db_appendMethod:(SEL)newMethod fromClass:(Class)klass;

/**
 替换方法
 
 @param method 新方法
 @param klass 指定类
 */
+ (void)db_replaceMethod:(SEL)method fromClass:(Class)klass;

/**
 判断当前类的向上继承链是否可响应指定消息
 
 @param selector 消息名
 @param stopClass 继承链上停止查询的父类
 @return YES 判断结果
 */
- (BOOL)db_respondsToSelector:(SEL)selector untilClass:(Class)stopClass;

/**
 判断当前类的父类是否可响应指定消息
 
 @param selector 消息名
 @return YES 判断结果
 */
- (BOOL)db_superRespondsToSelector:(SEL)selector;

/**
 判断当前类的父类向上继承链是否可响应指定消息
 
 @param selector 消息名
 @param stopClass 继承链上停止查询的父类
 @return YES 判断结果
 */
- (BOOL)db_superRespondsToSelector:(SEL)selector untilClass:(Class)stopClass;

/**
 判断当前类的向上继承链实例是否可响应指定消息
 
 @param selector 消息名
 @param stopClass 继承链上停止查询的父类
 @return YES 判断结果
 */
+ (BOOL)db_instancesRespondToSelector:(SEL)selector untilClass:(Class)stopClass;

@end

NS_ASSUME_NONNULL_END

//
//  NSNotificationCenter+DBMainThread.h
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/3.
//  Copyright © 2019年 DB. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSNotificationCenter (DBMainThread)

/**
 *  @brief  在主线程中发送一条通知
 *
 *  @param notification NSNotification对象
 */
- (void)db_postNotificationOnMainThread:(NSNotification *)notification;

/**
 *  @brief  在主线程中发送一条通知
 *
 *  @param aName    用来生成新通知的通知名称
 *  @param anObject 通知携带的对象
 */
- (void)db_postNotificationOnMainThreadName:(NSString *)aName object:(id)anObject;

/**
 *  @brief  在主线程中发送一条通知
 *
 *  @param aName     用来生成新通知的通知名称
 *  @param anObject  通知携带的对象
 *  @param aUserInfo 通知携带的用户信息
 */
- (void)db_postNotificationOnMainThreadName:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo;

@end

NS_ASSUME_NONNULL_END

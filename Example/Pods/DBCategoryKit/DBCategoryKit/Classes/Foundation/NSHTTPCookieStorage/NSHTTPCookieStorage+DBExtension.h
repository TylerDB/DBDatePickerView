//
//  NSHTTPCookieStorage+DBExtension.h
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/3.
//  Copyright © 2019年 DB. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSHTTPCookieStorage (DBExtension)

/**
 *  @brief 存储 Web cookies到磁盘目录
 */
- (void)db_saveCookie;

/**
 *  @brief 读取 Web cookies从磁盘目录
 */
- (void)db_loadCookie;

@end

NS_ASSUME_NONNULL_END

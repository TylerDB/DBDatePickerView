//
//  NSData+DBDataCache.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/29.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (DBDataCache)

/**
 *  将URL作为key保存到磁盘里缓存起来
 *
 *  @param identifier url.absoluteString
 */
- (void)db_saveDataCacheWithIdentifier:(NSString *)identifier;

/**
 *  取出缓存data
 *
 *  @param identifier url.absoluteString
 *
 *  @return 缓存
 */
+ (NSData *)db_getDataCacheWithIdentifier:(NSString *)identifier;

@end

NS_ASSUME_NONNULL_END

//
//  NSData+DBGzip.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/29.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (DBGzip)

/**
 *  @brief  GZIP压缩
 *
 *  @param level 压缩级别
 *
 *  @return 压缩后的数据
 */
- (NSData *)db_gzippedDataWithCompressionLevel:(float)level;

/**
 *  @brief  GZIP压缩 压缩级别 默认-1
 *
 *  @return 压缩后的数据
 */
- (NSData *)db_gzippedData;

/**
 *  @brief  GZIP解压
 *
 *  @return 解压后数据
 */
- (NSData *)db_gunzippedData;

- (BOOL)db_isGzippedData;

@end

NS_ASSUME_NONNULL_END

//
//  NSData+DBHash.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/29.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (DBHash)

/**
 *  @brief  md5 NSData
 */
@property (readonly) NSData *db_md5Data;

/**
 *  @brief  sha1Data NSData
 */
@property (readonly) NSData *db_sha1Data;

/**
 *  @brief  sha256Data NSData
 */
@property (readonly) NSData *db_sha256Data;

/**
 *  @brief  sha512Data NSData
 */
@property (readonly) NSData *db_sha512Data;

/**
 *  @brief  md5 NSData
 *
 *  @param key 密钥
 *
 *  @return 结果
 */
- (NSData *)db_hmacMD5DataWithKey:(NSData *)key;

/**
 *  @brief  sha1Data NSData
 *
 *  @param key 密钥
 *
 *  @return 结果
 */
- (NSData *)db_hmacSHA1DataWithKey:(NSData *)key;

/**
 *  @brief  sha256Data NSData
 *
 *  @param key 密钥
 *
 *  @return 结果
 */
- (NSData *)db_hmacSHA256DataWithKey:(NSData *)key;

/**
 *  @brief  sha512Data NSData
 *
 *  @param key 密钥
 *
 *  @return 结果
 */
- (NSData *)db_hmacSHA512DataWithKey:(NSData *)key;

@end

NS_ASSUME_NONNULL_END

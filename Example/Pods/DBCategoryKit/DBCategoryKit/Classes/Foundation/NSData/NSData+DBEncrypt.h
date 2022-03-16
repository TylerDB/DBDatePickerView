//
//  NSData+DBEncrypt.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/29.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (DBEncrypt)

/**
 *  利用AES加密数据
 *
 *  @param key  key 长度一般为16（AES算法所能支持的密钥长度可以为128,192,256位（也即16，24，32个字节））
 *  @param iv  iv description
 *
 *  @return data
 */
- (NSData *)db_encryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv;

/**
 *  @brief  利用AES解密据
 *
 *  @param key key 长度一般为16 （AES算法所能支持的密钥长度可以为128,192,256位（也即16，24，32个字节））
 *  @param iv  iv
 *
 *  @return 解密后数据
 */
- (NSData *)db_decryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv;

/**
 *  利用DES加密数据
 *
 *  @param key key 长度一般为8
 *  @param iv  iv description
 *
 *  @return data
 */
- (NSData *)db_encryptedWithDESUsingKey:(NSString*)key andIV:(NSData*)iv;

/**
 *  @brief   利用DES解密数据
 *
 *  @param key key 长度一般为8
 *  @param iv  iv
 *
 *  @return 解密后数据
 */
- (NSData *)db_decryptedWithDESUsingKey:(NSString*)key andIV:(NSData*)iv;

/**
 *  利用3DES加密数据
 *
 *  @param key key 长度一般为24
 *  @param iv  iv description
 *
 *  @return data
 */
- (NSData *)db_encryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv;

/**
 *  @brief   利用3DES解密数据
 *
 *  @param key key 长度一般为24
 *  @param iv  iv
 *
 *  @return 解密后数据
 */
- (NSData *)db_decryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv;


- (NSData *)db_CCCryptData:(NSData *)data
                 algorithm:(CCAlgorithm)algorithm
                 operation:(CCOperation)operation
                       key:(NSString *)key
                        iv:(NSData *)iv;

/**
 *  @brief  NSData 转成UTF8 字符串
 *
 *  @return 转成UTF8 字符串
 */
- (NSString *)db_UTF8String;

@end

NS_ASSUME_NONNULL_END

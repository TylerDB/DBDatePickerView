//
//  NSData+DBHash.m
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/29.
//  Copyright © 2018年 DB. All rights reserved.
//

#import "NSData+DBHash.h"
#include <CommonCrypto/CommonCrypto.h>

@implementation NSData (DBHash)

- (NSData *)db_md5Data
{
    unsigned char bytes[CC_MD5_DIGEST_LENGTH];
    CC_MD5(self.bytes, (CC_LONG)self.length, bytes);
    return [NSData dataWithBytes:bytes length:CC_MD5_DIGEST_LENGTH];
}

- (NSData *)db_sha1Data
{
    unsigned char bytes[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(self.bytes, (CC_LONG)self.length, bytes);
    return [NSData dataWithBytes:bytes length:CC_SHA1_DIGEST_LENGTH];
}

- (NSData *)db_sha256Data
{
    unsigned char bytes[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(self.bytes, (CC_LONG)self.length, bytes);
    return [NSData dataWithBytes:bytes length:CC_SHA256_DIGEST_LENGTH];
}

- (NSData *)db_sha512Data
{
    unsigned char bytes[CC_SHA512_DIGEST_LENGTH];
    CC_SHA512(self.bytes, (CC_LONG)self.length, bytes);
    return [NSData dataWithBytes:bytes length:CC_SHA512_DIGEST_LENGTH];
}

- (NSData *)db_hmacMD5DataWithKey:(NSData *)key {
    return [self db_hmacDataUsingAlg:kCCHmacAlgMD5 withKey:key];
}

- (NSData *)db_hmacSHA1DataWithKey:(NSData *)key
{
    return [self db_hmacDataUsingAlg:kCCHmacAlgSHA1 withKey:key];
}

- (NSData *)db_hmacSHA256DataWithKey:(NSData *)key
{
    return [self db_hmacDataUsingAlg:kCCHmacAlgSHA256 withKey:key];
}

- (NSData *)db_hmacSHA512DataWithKey:(NSData *)key
{
    return [self db_hmacDataUsingAlg:kCCHmacAlgSHA512 withKey:key];
}

- (NSData *)db_hmacDataUsingAlg:(CCHmacAlgorithm)alg withKey:(NSData *)key {
    
    size_t size;
    switch (alg) {
        case kCCHmacAlgMD5: size = CC_MD5_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA1: size = CC_SHA1_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA224: size = CC_SHA224_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA256: size = CC_SHA256_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA384: size = CC_SHA384_DIGEST_LENGTH; break;
        case kCCHmacAlgSHA512: size = CC_SHA512_DIGEST_LENGTH; break;
        default: return nil;
    }
    unsigned char result[size];
    CCHmac(alg, [key bytes], key.length, self.bytes, self.length, result);
    return [NSData dataWithBytes:result length:size];
}

@end

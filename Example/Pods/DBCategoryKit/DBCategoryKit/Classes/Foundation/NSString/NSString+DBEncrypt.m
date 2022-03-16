//
//  NSString+DBEncrypt.m
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/5.
//  Copyright © 2019年 DB. All rights reserved.
//

#import "NSString+DBEncrypt.h"
#import <DBCategoryKit/NSData+DBEncrypt.h>
#import <DBCategoryKit/NSData+DBBase64.h>

@implementation NSString (DBEncrypt)

- (NSString*)db_encryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv {
    NSData *encrypted = [[self dataUsingEncoding:NSUTF8StringEncoding] db_encryptedWithAESUsingKey:key andIV:iv];
    NSString *encryptedString = [encrypted db_base64EncodedString];
    
    return encryptedString;
}

- (NSString*)db_decryptedWithAESUsingKey:(NSString*)key andIV:(NSData*)iv {
    NSData *decrypted = [[NSData db_dataWithBase64EncodedString:self] db_decryptedWithAESUsingKey:key andIV:iv];
    NSString *decryptedString = [[NSString alloc] initWithData:decrypted encoding:NSUTF8StringEncoding];
    
    return decryptedString;
}

- (NSString*)db_encryptedWithDESUsingKey:(NSString*)key andIV:(NSData*)iv {
    NSData *encrypted = [[self dataUsingEncoding:NSUTF8StringEncoding] db_encryptedWithDESUsingKey:key andIV:iv];
    NSString *encryptedString = [encrypted db_base64EncodedString];
    
    return encryptedString;
}

- (NSString*)db_decryptedWithDESUsingKey:(NSString*)key andIV:(NSData*)iv {
    NSData *decrypted = [[NSData db_dataWithBase64EncodedString:self] db_decryptedWithDESUsingKey:key andIV:iv];
    NSString *decryptedString = [[NSString alloc] initWithData:decrypted encoding:NSUTF8StringEncoding];
    
    return decryptedString;
}

- (NSString*)db_encryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv {
    NSData *encrypted = [[self dataUsingEncoding:NSUTF8StringEncoding] db_encryptedWith3DESUsingKey:key andIV:iv];
    NSString *encryptedString = [encrypted db_base64EncodedString];
    
    return encryptedString;
}

- (NSString*)db_decryptedWith3DESUsingKey:(NSString*)key andIV:(NSData*)iv {
    NSData *decrypted = [[NSData db_dataWithBase64EncodedString:self] db_decryptedWith3DESUsingKey:key andIV:iv];
    NSString *decryptedString = [[NSString alloc] initWithData:decrypted encoding:NSUTF8StringEncoding];
    
    return decryptedString;
}

@end

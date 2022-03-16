//
//  NSUserDefaults+DBSafeAccess.h
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/3.
//  Copyright © 2019年 DB. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSUserDefaults (DBSafeAccess)

+ (NSString *)db_stringForKey:(NSString *)defaultName;

+ (NSArray *)db_arrayForKey:(NSString *)defaultName;

+ (NSDictionary *)db_dictionaryForKey:(NSString *)defaultName;

+ (NSData *)db_dataForKey:(NSString *)defaultName;

+ (NSArray *)db_stringArrayForKey:(NSString *)defaultName;

+ (NSInteger)db_integerForKey:(NSString *)defaultName;

+ (float)db_floatForKey:(NSString *)defaultName;

+ (double)db_doubleForKey:(NSString *)defaultName;

+ (BOOL)db_boolForKey:(NSString *)defaultName;

+ (NSURL *)db_URLForKey:(NSString *)defaultName;

#pragma mark - WRITE FOR STANDARD

+ (void)db_setObject:(id)value forKey:(NSString *)defaultName;

#pragma mark - READ ARCHIVE FOR STANDARD

+ (id)db_arcObjectForKey:(NSString *)defaultName;

#pragma mark - WRITE ARCHIVE FOR STANDARD

+ (void)db_setArcObject:(id)value forKey:(NSString *)defaultName;

@end

NS_ASSUME_NONNULL_END

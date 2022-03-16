//
//  NSDictionary+DBSafeAccess.h
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/5.
//  Copyright © 2019年 DB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (DBSafeAccess)

- (BOOL)db_hasKey:(NSString *)key;

- (NSString *)db_stringForKey:(id)key;

- (NSNumber *)db_numberForKey:(id)key;

- (NSDecimalNumber *)db_decimalNumberForKey:(id)key;

- (NSArray *)db_arrayForKey:(id)key;

- (NSDictionary *)db_dictionaryForKey:(id)key;

- (NSInteger)db_integerForKey:(id)key;

- (NSUInteger)db_unsignedIntegerForKey:(id)key;

- (BOOL)db_boolForKey:(id)key;

- (int16_t)db_int16ForKey:(id)key;

- (int32_t)db_int32ForKey:(id)key;

- (int64_t)db_int64ForKey:(id)key;

- (char)db_charForKey:(id)key;

- (short)db_shortForKey:(id)key;

- (float)db_floatForKey:(id)key;

- (double)db_doubleForKey:(id)key;

- (long long)db_longLongForKey:(id)key;

- (unsigned long long)db_unsignedLongLongForKey:(id)key;

- (NSDate *)db_dateForKey:(id)key dateFormat:(NSString *)dateFormat;

//CG
- (CGFloat)db_CGFloatForKey:(id)key;

- (CGPoint)db_pointForKey:(id)key;

- (CGSize)db_sizeForKey:(id)key;

- (CGRect)db_rectForKey:(id)key;

@end

@interface NSMutableDictionary (DBSafeAccess)

-(void)db_setObj:(id)i forKey:(NSString *)key;

-(void)db_setString:(NSString *)i forKey:(NSString *)key;

-(void)db_setBool:(BOOL)i forKey:(NSString *)key;

-(void)db_setInt:(int)i forKey:(NSString *)key;

-(void)db_setInteger:(NSInteger)i forKey:(NSString *)key;

-(void)db_setUnsignedInteger:(NSUInteger)i forKey:(NSString *)key;

-(void)db_setCGFloat:(CGFloat)f forKey:(NSString *)key;

-(void)db_setChar:(char)c forKey:(NSString *)key;

-(void)db_setFloat:(float)i forKey:(NSString *)key;

-(void)db_setDouble:(double)i forKey:(NSString *)key;

-(void)db_setLongLong:(long long)i forKey:(NSString *)key;

-(void)db_setPoint:(CGPoint)o forKey:(NSString *)key;

-(void)db_setSize:(CGSize)o forKey:(NSString *)key;

-(void)db_setRect:(CGRect)o forKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END

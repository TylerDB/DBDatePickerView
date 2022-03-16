//
//  NSArray+DBSafeAccess.h
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/5.
//  Copyright © 2019年 DB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (DBSafeAccess)

-(id)db_objectWithIndex:(NSUInteger)index;

- (NSString *)db_stringWithIndex:(NSUInteger)index;

- (NSNumber *)db_numberWithIndex:(NSUInteger)index;

- (NSDecimalNumber *)db_decimalNumberWithIndex:(NSUInteger)index;

- (NSArray *)db_arrayWithIndex:(NSUInteger)index;

- (NSDictionary *)db_dictionaryWithIndex:(NSUInteger)index;

- (NSInteger)db_integerWithIndex:(NSUInteger)index;

- (NSUInteger)db_unsignedIntegerWithIndex:(NSUInteger)index;

- (BOOL)db_boolWithIndex:(NSUInteger)index;

- (int16_t)db_int16WithIndex:(NSUInteger)index;

- (int32_t)db_int32WithIndex:(NSUInteger)index;

- (int64_t)db_int64WithIndex:(NSUInteger)index;

- (char)db_charWithIndex:(NSUInteger)index;

- (short)db_shortWithIndex:(NSUInteger)index;

- (float)db_floatWithIndex:(NSUInteger)index;

- (double)db_doubleWithIndex:(NSUInteger)index;

- (NSDate *)db_dateWithIndex:(NSUInteger)index dateFormat:(NSString *)dateFormat;
//CG
- (CGFloat)db_CGFloatWithIndex:(NSUInteger)index;

- (CGPoint)db_pointWithIndex:(NSUInteger)index;

- (CGSize)db_sizeWithIndex:(NSUInteger)index;

- (CGRect)db_rectWithIndex:(NSUInteger)index;

@end

@interface NSMutableArray (DBSafeAccess)

-(void)db_addObj:(id)i;

-(void)db_addString:(NSString *)i;

-(void)db_addBool:(BOOL)i;

-(void)db_addInt:(int)i;

-(void)db_addInteger:(NSInteger)i;

-(void)db_addUnsignedInteger:(NSUInteger)i;

-(void)db_addCGFloat:(CGFloat)f;

-(void)db_addChar:(char)c;

-(void)db_addFloat:(float)i;

-(void)db_addPoint:(CGPoint)o;

-(void)db_addSize:(CGSize)o;

-(void)db_addRect:(CGRect)o;

@end

NS_ASSUME_NONNULL_END

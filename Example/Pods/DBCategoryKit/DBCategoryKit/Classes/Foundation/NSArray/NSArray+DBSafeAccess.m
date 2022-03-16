//
//  NSArray+DBSafeAccess.m
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/5.
//  Copyright © 2019年 DB. All rights reserved.
//

#import "NSArray+DBSafeAccess.h"

@implementation NSArray (DBSafeAccess)

-(id)db_objectWithIndex:(NSUInteger)index{
    if (index <self.count) {
        return self[index];
    }else{
        return nil;
    }
}

- (NSString *)db_stringWithIndex:(NSUInteger)index
{
    id value = [self db_objectWithIndex:index];
    if (value == nil || value == [NSNull null] || [[value description] isEqualToString:@"<null>"])
    {
        return nil;
    }
    if ([value isKindOfClass:[NSString class]]) {
        return (NSString*)value;
    }
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value stringValue];
    }
    
    return nil;
}

- (NSNumber *)db_numberWithIndex:(NSUInteger)index
{
    id value = [self db_objectWithIndex:index];
    if ([value isKindOfClass:[NSNumber class]]) {
        return (NSNumber*)value;
    }
    if ([value isKindOfClass:[NSString class]]) {
        NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        return [f numberFromString:(NSString*)value];
    }
    return nil;
}

- (NSDecimalNumber *)db_decimalNumberWithIndex:(NSUInteger)index{
    id value = [self db_objectWithIndex:index];
    
    if ([value isKindOfClass:[NSDecimalNumber class]]) {
        return value;
    } else if ([value isKindOfClass:[NSNumber class]]) {
        NSNumber * number = (NSNumber*)value;
        return [NSDecimalNumber decimalNumberWithDecimal:[number decimalValue]];
    } else if ([value isKindOfClass:[NSString class]]) {
        NSString * str = (NSString*)value;
        return [str isEqualToString:@""] ? nil : [NSDecimalNumber decimalNumberWithString:str];
    }
    return nil;
}

- (NSArray *)db_arrayWithIndex:(NSUInteger)index
{
    id value = [self db_objectWithIndex:index];
    if (value == nil || value == [NSNull null])
    {
        return nil;
    }
    if ([value isKindOfClass:[NSArray class]])
    {
        return value;
    }
    return nil;
}

- (NSDictionary *)db_dictionaryWithIndex:(NSUInteger)index
{
    id value = [self db_objectWithIndex:index];
    if (value == nil || value == [NSNull null])
    {
        return nil;
    }
    if ([value isKindOfClass:[NSDictionary class]])
    {
        return value;
    }
    return nil;
}

- (NSInteger)db_integerWithIndex:(NSUInteger)index
{
    id value = [self db_objectWithIndex:index];
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]])
    {
        return [value integerValue];
    }
    return 0;
}

- (NSUInteger)db_unsignedIntegerWithIndex:(NSUInteger)index
{
    id value = [self db_objectWithIndex:index];
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]])
    {
        return [value unsignedIntegerValue];
    }
    return 0;
}

- (BOOL)db_boolWithIndex:(NSUInteger)index
{
    id value = [self db_objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return NO;
    }
    if ([value isKindOfClass:[NSNumber class]])
    {
        return [value boolValue];
    }
    if ([value isKindOfClass:[NSString class]])
    {
        return [value boolValue];
    }
    return NO;
}

- (int16_t)db_int16WithIndex:(NSUInteger)index
{
    id value = [self db_objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]])
    {
        return [value shortValue];
    }
    if ([value isKindOfClass:[NSString class]])
    {
        return [value intValue];
    }
    return 0;
}

- (int32_t)db_int32WithIndex:(NSUInteger)index
{
    id value = [self db_objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value intValue];
    }
    return 0;
}

- (int64_t)db_int64WithIndex:(NSUInteger)index
{
    id value = [self db_objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value longLongValue];
    }
    return 0;
}

- (char)db_charWithIndex:(NSUInteger)index{
    
    id value = [self db_objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value charValue];
    }
    return 0;
}

- (short)db_shortWithIndex:(NSUInteger)index
{
    id value = [self db_objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]])
    {
        return [value shortValue];
    }
    if ([value isKindOfClass:[NSString class]])
    {
        return [value intValue];
    }
    return 0;
}

- (float)db_floatWithIndex:(NSUInteger)index
{
    id value = [self db_objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value floatValue];
    }
    return 0;
}

- (double)db_doubleWithIndex:(NSUInteger)index
{
    id value = [self db_objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]])
    {
        return [value doubleValue];
    }
    return 0;
}

- (NSDate *)db_dateWithIndex:(NSUInteger)index dateFormat:(NSString *)dateFormat {
    NSDateFormatter *formater = [[NSDateFormatter alloc]init];
    formater.dateFormat = dateFormat;
    id value = [self db_objectWithIndex:index];
    
    if (value == nil || value == [NSNull null])
    {
        return nil;
    }
    
    if ([value isKindOfClass:[NSString class]] && ![value isEqualToString:@""] && !dateFormat) {
        return [formater dateFromString:value];
    }
    return nil;
}

//CG
- (CGFloat)db_CGFloatWithIndex:(NSUInteger)index
{
    id value = [self db_objectWithIndex:index];
    
    CGFloat f = [value doubleValue];
    
    return f;
}

- (CGPoint)db_pointWithIndex:(NSUInteger)index
{
    id value = [self db_objectWithIndex:index];
    
    CGPoint point = CGPointFromString(value);
    
    return point;
}
- (CGSize)db_sizeWithIndex:(NSUInteger)index
{
    id value = [self db_objectWithIndex:index];
    
    CGSize size = CGSizeFromString(value);
    
    return size;
}
- (CGRect)db_rectWithIndex:(NSUInteger)index
{
    id value = [self db_objectWithIndex:index];
    
    CGRect rect = CGRectFromString(value);
    
    return rect;
}

@end

@implementation NSMutableArray (DBSafeAccess)

- (void)db_addObj:(id)i{
    if (i!=nil) {
        [self addObject:i];
    }
}

- (void)db_addString:(NSString *)i
{
    if (i!=nil) {
        [self addObject:i];
    }
}

- (void)db_addBool:(BOOL)i
{
    [self addObject:@(i)];
}

- (void)db_addInt:(int)i
{
    [self addObject:@(i)];
}

- (void)db_addInteger:(NSInteger)i
{
    [self addObject:@(i)];
}

- (void)db_addUnsignedInteger:(NSUInteger)i
{
    [self addObject:@(i)];
}

- (void)db_addCGFloat:(CGFloat)f
{
    [self addObject:@(f)];
}

- (void)db_addChar:(char)c
{
    [self addObject:@(c)];
}

- (void)db_addFloat:(float)i
{
    [self addObject:@(i)];
}

- (void)db_addPoint:(CGPoint)o
{
    [self addObject:NSStringFromCGPoint(o)];
}

- (void)db_addSize:(CGSize)o
{
    [self addObject:NSStringFromCGSize(o)];
}

- (void)db_addRect:(CGRect)o
{
    [self addObject:NSStringFromCGRect(o)];
}

@end

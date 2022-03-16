//
//  NSDecimalNumber+DBExtension.m
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/3.
//  Copyright © 2019年 DB. All rights reserved.
//

#import "NSDecimalNumber+DBExtension.h"

@implementation NSDecimalNumber (DBExtension)

- (NSDecimalNumber *)db_roundToScale:(NSUInteger)scale{
    return [self db_roundToScale:scale mode:NSRoundPlain];
}

- (NSDecimalNumber *)db_roundToScale:(NSUInteger)scale mode:(NSRoundingMode)roundingMode{
    NSDecimalNumberHandler * handler = [[NSDecimalNumberHandler alloc] initWithRoundingMode:roundingMode scale:scale raiseOnExactness:NO raiseOnOverflow:YES raiseOnUnderflow:YES raiseOnDivideByZero:YES];
    return [self decimalNumberByRoundingAccordingToBehavior:handler];
}

- (NSDecimalNumber*)db_decimalNumberWithPercentage:(float)percent {
    NSDecimalNumber * percentage = [NSDecimalNumber decimalNumberWithDecimal:[[NSNumber numberWithFloat:percent] decimalValue]];
    return [self decimalNumberByMultiplyingBy:percentage];
}

- (NSDecimalNumber *)db_decimalNumberWithDiscountPercentage:(NSDecimalNumber *)discountPercentage {
    NSDecimalNumber * hundred = [NSDecimalNumber decimalNumberWithString:@"100"];
    NSDecimalNumber * percent = [self decimalNumberByMultiplyingBy:[discountPercentage decimalNumberByDividingBy:hundred]];
    return [self decimalNumberBySubtracting:percent];
}

- (NSDecimalNumber *)db_decimalNumberWithDiscountPercentage:(NSDecimalNumber *)discountPercentage roundToScale:(NSUInteger)scale {
    NSDecimalNumber * value = [self db_decimalNumberWithDiscountPercentage:discountPercentage];
    return [value db_roundToScale:scale];
}

- (NSDecimalNumber *)db_discountPercentageWithBaseValue:(NSDecimalNumber *)baseValue {
    NSDecimalNumber * hundred = [NSDecimalNumber decimalNumberWithString:@"100"];
    NSDecimalNumber * percentage = [[self decimalNumberByDividingBy:baseValue] decimalNumberByMultiplyingBy:hundred];
    return [hundred decimalNumberBySubtracting:percentage];
}

- (NSDecimalNumber *)db_discountPercentageWithBaseValue:(NSDecimalNumber *)baseValue roundToScale:(NSUInteger)scale {
    NSDecimalNumber * discount = [self db_discountPercentageWithBaseValue:baseValue];
    return [discount db_roundToScale:scale];
}

@end

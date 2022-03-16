//
//  NSNumber+DBRound.m
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/3.
//  Copyright © 2019年 DB. All rights reserved.
//

#import "NSNumber+DBRound.h"

@implementation NSNumber (DBRound)

#pragma mark - Display
- (NSString*)db_toDisplayNumberWithDigit:(NSInteger)digit
{
    NSString *result = nil;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setRoundingMode:NSNumberFormatterRoundHalfUp];
    [formatter setMaximumFractionDigits:digit];
    result = [formatter  stringFromNumber:self];
    if (result == nil)
        return @"";
    return result;
    
}

- (NSString*)db_toDisplayPercentageWithDigit:(NSInteger)digit
{
    NSString *result = nil;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterPercentStyle];
    [formatter setRoundingMode:NSNumberFormatterRoundHalfUp];
    [formatter setMaximumFractionDigits:digit];
    //NSLog(@"percentage target:%@ result:%@",number,[formatter  stringFromNumber:number]);
    result = [formatter  stringFromNumber:self];
    return result;
}

#pragma mark - ceil , round, floor
- (NSNumber*)db_doRoundWithDigit:(NSUInteger)digit
{
    NSNumber *result = nil;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setRoundingMode:NSNumberFormatterRoundHalfUp];
    [formatter setMaximumFractionDigits:digit];
    [formatter setMinimumFractionDigits:digit];
    //NSLog(@"round target:%@ result:%@",number,[formatter  stringFromNumber:number]);
    result = [NSNumber numberWithDouble:[[formatter  stringFromNumber:self] doubleValue]];
    return result;
}

- (NSNumber*)db_doCeilWithDigit:(NSUInteger)digit
{
    NSNumber *result = nil;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setRoundingMode:NSNumberFormatterRoundCeiling];
    [formatter setMaximumFractionDigits:digit];
    //NSLog(@"ceil target:%@ result:%@",number,[formatter  stringFromNumber:number]);
    result = [NSNumber numberWithDouble:[[formatter  stringFromNumber:self] doubleValue]];
    return result;
}

- (NSNumber*)db_doFloorWithDigit:(NSUInteger)digit
{
    NSNumber *result = nil;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setRoundingMode:NSNumberFormatterRoundFloor];
    [formatter setMaximumFractionDigits:digit];
    result = [NSNumber numberWithDouble:[[formatter  stringFromNumber:self] doubleValue]];
    //NSLog(@"prev:%@, result:%@",number, result);
    return result;
}

@end

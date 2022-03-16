//
//  NSDecimalNumber+DBExtension.h
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/3.
//  Copyright © 2019年 DB. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDecimalNumber (DBExtension)

/**
 *  @brief  四舍五入 NSRoundPlain
 *
 *  @param scale 限制位数
 *
 *  @return 返回结果
 */
- (NSDecimalNumber*)db_roundToScale:(NSUInteger)scale;

/**
 *  @brief  四舍五入
 *
 *  @param scale        限制位数
 *  @param roundingMode NSRoundingMode
 *
 *  @return 返回结果
 */
- (NSDecimalNumber*)db_roundToScale:(NSUInteger)scale mode:(NSRoundingMode)roundingMode;

- (NSDecimalNumber*)db_decimalNumberWithPercentage:(float)percent;
- (NSDecimalNumber*)db_decimalNumberWithDiscountPercentage:(NSDecimalNumber *)discountPercentage;
- (NSDecimalNumber*)db_decimalNumberWithDiscountPercentage:(NSDecimalNumber *)discountPercentage roundToScale:(NSUInteger)scale;
- (NSDecimalNumber*)db_discountPercentageWithBaseValue:(NSDecimalNumber *)baseValue;
- (NSDecimalNumber*)db_discountPercentageWithBaseValue:(NSDecimalNumber *)baseValue roundToScale:(NSUInteger)scale;

@end

NS_ASSUME_NONNULL_END

//
//  NSNumber+DBRound.h
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/3.
//  Copyright © 2019年 DB. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSNumber (DBRound)

/* 展示 */
- (NSString*)db_toDisplayNumberWithDigit:(NSInteger)digit;
- (NSString*)db_toDisplayPercentageWithDigit:(NSInteger)digit;

/*　四舍五入 */
/**
 *  @brief  四舍五入
 *
 *  @param digit  限制最大位数
 *
 *  @return 结果
 */
- (NSNumber*)db_doRoundWithDigit:(NSUInteger)digit;

/**
 *  @brief  取上整
 *
 *  @param digit  限制最大位数
 *
 *  @return 结果
 */
- (NSNumber*)db_doCeilWithDigit:(NSUInteger)digit;

/**
 *  @brief  取下整
 *
 *  @param digit  限制最大位数
 *
 *  @return 结果
 */
- (NSNumber*)db_doFloorWithDigit:(NSUInteger)digit;

@end

NS_ASSUME_NONNULL_END

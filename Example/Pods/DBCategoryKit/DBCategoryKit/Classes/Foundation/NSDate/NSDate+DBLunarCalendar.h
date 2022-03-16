//
//  NSDate+DBLunarCalendar.h
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/3.
//  Copyright © 2019年 DB. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (DBLunarCalendar)

+ (NSCalendar *)db_chineseCalendar;
//例如 五月初一
+ (NSString*)db_currentMDDateString;
//例如 乙未年五月初一
+ (NSString*)db_currentYMDDateString;
//例如 星期一
+ (NSString *)db_currentWeek:(NSDate*)date;
//例如 星期一
+ (NSString *)db_currentWeekWithDateString:(NSString*)datestring;
//例如 五月一
+ (NSString*)db_currentCapitalDateString;

@end

NS_ASSUME_NONNULL_END

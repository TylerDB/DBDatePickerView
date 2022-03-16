//
//  NSDate+DBExtension.h
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/3.
//  Copyright © 2019年 DB. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (DBExtension)

/**
 * 获取日、月、年、小时、分钟、秒
 */
- (NSUInteger)db_day;
- (NSUInteger)db_month;
- (NSUInteger)db_year;
- (NSUInteger)db_hour;
- (NSUInteger)db_minute;
- (NSUInteger)db_second;
+ (NSUInteger)db_day:(NSDate *)date;
+ (NSUInteger)db_month:(NSDate *)date;
+ (NSUInteger)db_year:(NSDate *)date;
+ (NSUInteger)db_hour:(NSDate *)date;
+ (NSUInteger)db_minute:(NSDate *)date;
+ (NSUInteger)db_second:(NSDate *)date;

/**
 * 获取一年中的总天数
 */
- (NSUInteger)db_daysInYear;
+ (NSUInteger)db_daysInYear:(NSDate *)date;

/**
 * 判断是否是润年
 * @return YES表示润年，NO表示平年
 */
- (BOOL)db_isLeapYear;
+ (BOOL)db_isLeapYear:(NSDate *)date;

/**
 * 获取该日期是该年的第几周
 */
- (NSUInteger)db_weekOfYear;
+ (NSUInteger)db_weekOfYear:(NSDate *)date;

/**
 * 获取格式化为YYYY-MM-dd格式的日期字符串
 */
- (NSString *)db_formatYMD;
+ (NSString *)db_formatYMD:(NSDate *)date;

/**
 * 返回当前月一共有几周(可能为4,5,6)
 */
- (NSUInteger)db_weeksOfMonth;
+ (NSUInteger)db_weeksOfMonth:(NSDate *)date;

/**
 * 获取该月的第一天的日期
 */
- (NSDate *)db_begindayOfMonth;
+ (NSDate *)db_begindayOfMonth:(NSDate *)date;

/**
 * 获取该月的最后一天的日期
 */
- (NSDate *)db_lastdayOfMonth;
+ (NSDate *)db_lastdayOfMonth:(NSDate *)date;

/**
 * 返回day天后的日期(若day为负数,则为|day|天前的日期)
 */
- (NSDate *)db_dateAfterDay:(NSUInteger)day;
+ (NSDate *)db_dateAfterDate:(NSDate *)date day:(NSInteger)day;

/**
 * 返回day天后的日期(若day为负数,则为|day|天前的日期)
 */
- (NSDate *)db_dateAfterMonth:(NSUInteger)month;
+ (NSDate *)db_dateAfterDate:(NSDate *)date month:(NSInteger)month;

/**
 * 返回numYears年后的日期
 */
- (NSDate *)db_offsetYears:(int)numYears;
+ (NSDate *)db_offsetYears:(int)numYears fromDate:(NSDate *)fromDate;

/**
 * 返回numMonths月后的日期
 */
- (NSDate *)db_offsetMonths:(int)numMonths;
+ (NSDate *)db_offsetMonths:(int)numMonths fromDate:(NSDate *)fromDate;

/**
 * 返回numDays天后的日期
 */
- (NSDate *)db_offsetDays:(int)numDays;
+ (NSDate *)db_offsetDays:(int)numDays fromDate:(NSDate *)fromDate;

/**
 * 返回numHours小时后的日期
 */
- (NSDate *)db_offsetHours:(int)hours;
+ (NSDate *)db_offsetHours:(int)numHours fromDate:(NSDate *)fromDate;

/**
 * 距离该日期前几天
 */
- (NSUInteger)db_daysAgo;
+ (NSUInteger)db_daysAgo:(NSDate *)date;

/**
 *  获取星期几
 *
 *  @return Return weekday number
 *  [1 - Sunday]
 *  [2 - Monday]
 *  [3 - Tuerday]
 *  [4 - Wednesday]
 *  [5 - Thursday]
 *  [6 - Friday]
 *  [7 - Saturday]
 */
- (NSInteger)db_weekday;
+ (NSInteger)db_weekday:(NSDate *)date;

/**
 *  获取星期几(名称)
 *
 *  @return Return weekday as a localized string
 *  [1 - Sunday]
 *  [2 - Monday]
 *  [3 - Tuerday]
 *  [4 - Wednesday]
 *  [5 - Thursday]
 *  [6 - Friday]
 *  [7 - Saturday]
 */
- (NSString *)db_dayFromWeekday;
+ (NSString *)db_dayFromWeekday:(NSDate *)date;

/**
 *  日期是否相等
 *
 *  @param anotherDate The another date to compare as NSDate
 *  @return Return YES if is same day, NO if not
 */
- (BOOL)db_isSameDay:(NSDate *)anotherDate;

/**
 *  Get the month as a localized string from the given month number
 *
 *  @param month The month to be converted in string
 *  [1 - January]
 *  [2 - February]
 *  [3 - March]
 *  [4 - April]
 *  [5 - May]
 *  [6 - June]
 *  [7 - July]
 *  [8 - August]
 *  [9 - September]
 *  [10 - October]
 *  [11 - November]
 *  [12 - December]
 *
 *  @return Return the given month as a localized string
 */
+ (NSString *)db_monthWithMonthNumber:(NSInteger)month;

/**
 * 根据日期返回字符串
 */
+ (NSString *)db_stringWithDate:(NSDate *)date format:(NSString *)format;
- (NSString *)db_stringWithFormat:(NSString *)format;

/**
 * 根据日期字符串返回Date
 */
+ (NSDate *)db_dateWithString:(NSString *)string format:(NSString *)format;

/**
 * 获取指定月份的天数
 */
- (NSUInteger)db_daysInMonth:(NSUInteger)month;
+ (NSUInteger)db_daysInMonth:(NSDate *)date month:(NSUInteger)month;

/**
 * 获取当前月份的天数
 */
- (NSUInteger)db_daysInMonth;
+ (NSUInteger)db_daysInMonth:(NSDate *)date;

/**
 * 返回x分钟前/x小时前/昨天/x天前/x个月前/x年前
 */
- (NSString *)db_timeInfo;
+ (NSString *)db_timeInfoWithDate:(NSDate *)date;
+ (NSString *)db_timeInfoWithDateString:(NSString *)dateString;

/**
 * 分别获取yyyy-MM-dd/HH:mm:ss/yyyy-MM-dd HH:mm:ss格式的字符串
 */
- (NSString *)db_ymdFormat;
- (NSString *)db_hmsFormat;
- (NSString *)db_ymdHmsFormat;
+ (NSString *)db_ymdFormat;
+ (NSString *)db_hmsFormat;
+ (NSString *)db_ymdHmsFormat;

@end

NS_ASSUME_NONNULL_END

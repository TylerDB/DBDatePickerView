//
//  NSDate+DBUtilities.h
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/3.
//  Copyright © 2019年 DB. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DB_D_MINUTE     60
#define DB_D_HOUR       3600
#define DB_D_DAY        86400
#define DB_D_WEEK       604800
#define DB_D_YEAR       31556926

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (DBUtilities)

#pragma mark - short time 格式化的时间
@property (nonatomic, readonly) NSString *db_shortString;
@property (nonatomic, readonly) NSString *db_shortDateString;
@property (nonatomic, readonly) NSString *db_shortTimeString;
@property (nonatomic, readonly) NSString *db_mediumString;
@property (nonatomic, readonly) NSString *db_mediumDateString;
@property (nonatomic, readonly) NSString *db_mediumTimeString;
@property (nonatomic, readonly) NSString *db_longString;
@property (nonatomic, readonly) NSString *db_longDateString;
@property (nonatomic, readonly) NSString *db_longTimeString;

// avoid bottlenecks
+ (NSCalendar *)db_currentCalendar;
//使用dateStyle timeStyle格式化时间
- (NSString *)db_stringWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle;

#pragma mark - 从当前日期相对日期时间
///明天
+ (NSDate *)db_dateTomorrow;
///昨天
+ (NSDate *)db_dateYesterday;
///今天后几天
+ (NSDate *)db_dateWithDaysFromNow:(NSInteger)days;
///今天前几天
+ (NSDate *)db_dateWithDaysBeforeNow:(NSInteger)days;
///当前小时后dHours个小时
+ (NSDate *)db_dateWithHoursFromNow:(NSInteger)dHours;
///当前小时前dHours个小时
+ (NSDate *)db_dateWithHoursBeforeNow:(NSInteger)dHours;
///当前分钟后dMinutes个分钟
+ (NSDate *)db_dateWithMinutesFromNow:(NSInteger)dMinutes;
///当前分钟前dMinutes个分钟
+ (NSDate *)db_dateWithMinutesBeforeNow:(NSInteger)dMinutes;

#pragma mark - Comparing dates 比较时间
///比较年月日是否相等
- (BOOL)db_isEqualToDateIgnoringTime:(NSDate *)aDate;
///是否是今天
- (BOOL)db_isToday;
///是否是明天
- (BOOL)db_isTomorrow;
///是否是昨天
- (BOOL)db_isYesterday;

///是否是同一周
- (BOOL)db_isSameWeekAsDate:(NSDate *)aDate;
///是否是本周
- (BOOL)db_isThisWeek;
///是否是本周的下周
- (BOOL)db_isNextWeek;
///是否是本周的上周
- (BOOL)db_isLastWeek;

///是否是同一月
- (BOOL)db_isSameMonthAsDate:(NSDate *)aDate;
///是否是本月
- (BOOL)db_isThisMonth;
///是否是本月的下月
- (BOOL)db_isNextMonth;
///是否是本月的上月
- (BOOL)db_isLastMonth;

///是否是同一年
- (BOOL)db_isSameYearAsDate:(NSDate *)aDate;
///是否是今年
- (BOOL)db_isThisYear;
///是否是今年的下一年
- (BOOL)db_isNextYear;
///是否是今年的上一年
- (BOOL)db_isLastYear;

///是否提前aDate
- (BOOL)db_isEarlierThanDate:(NSDate *)aDate;
///是否晚于aDate
- (BOOL)db_isLaterThanDate:(NSDate *)aDate;
///是否晚是未来
- (BOOL)db_isInFuture;
///是否晚是过去
- (BOOL)db_isInPast;

///是否是工作日
- (BOOL)db_isTypicallyWorkday;
///是否是周末
- (BOOL)db_isTypicallyWeekend;

#pragma mark ---- Adjusting dates 调节时间
///增加dYears年
- (NSDate *)db_dateByAddingYears:(NSInteger)dYears;
///减少dYears年
- (NSDate *)db_dateBySubtractingYears:(NSInteger)dYears;
///增加dMonths月
- (NSDate *)db_dateByAddingMonths:(NSInteger)dMonths;
///减少dMonths月
- (NSDate *)db_dateBySubtractingMonths:(NSInteger)dMonths;
///增加dDays天
- (NSDate *)db_dateByAddingDays:(NSInteger)dDays;
///减少dDays天
- (NSDate *)db_dateBySubtractingDays:(NSInteger)dDays;
///增加dHours小时
- (NSDate *)db_dateByAddingHours:(NSInteger)dHours;
///减少dHours小时
- (NSDate *)db_dateBySubtractingHours:(NSInteger)dHours;
///增加dMinutes分钟
- (NSDate *)db_dateByAddingMinutes:(NSInteger)dMinutes;
///减少dMinutes分钟
- (NSDate *)db_dateBySubtractingMinutes:(NSInteger)dMinutes;

#pragma mark - 时间间隔
///比aDate晚多少分钟
- (NSInteger)db_minutesAfterDate:(NSDate *)aDate;
///比aDate早多少分钟
- (NSInteger)db_minutesBeforeDate:(NSDate *)aDate;
///比aDate晚多少小时
- (NSInteger)db_hoursAfterDate:(NSDate *)aDate;
///比aDate早多少小时
- (NSInteger)db_hoursBeforeDate:(NSDate *)aDate;
///比aDate晚多少天
- (NSInteger)db_daysAfterDate:(NSDate *)aDate;
///比aDate早多少天
- (NSInteger)db_daysBeforeDate:(NSDate *)aDate;

///与anotherDate间隔几天
- (NSInteger)db_distanceDaysToDate:(NSDate *)anotherDate;
///与anotherDate间隔几月
- (NSInteger)db_distanceMonthsToDate:(NSDate *)anotherDate;
///与anotherDate间隔几年
- (NSInteger)db_distanceYearsToDate:(NSDate *)anotherDate;

@end

NS_ASSUME_NONNULL_END

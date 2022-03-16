//
//  NSDate+DBUtilities.m
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/3.
//  Copyright © 2019年 DB. All rights reserved.
//

#import "NSDate+DBUtilities.h"
#import <UIKit/UIKit.h>

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
#define DB_NSDATE_UTILITIES_COMPONENT_FLAGS \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wdeprecated-declarations\"") \
({ \
unsigned components;\
if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){ \
components = (NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekCalendarUnit |  NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit); \
}else{ \
components = (NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit); \
} \
components; \
})\
_Pragma("clang diagnostic pop") \

#else
#define DB_NSDATE_UTILITIES_COMPONENT_FLAGS \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wdeprecated-declarations\"") \
({\
unsigned components = (NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit); \
components; \
})\
_Pragma("clang diagnostic pop") \

#endif

@implementation NSDate (DBUtilities)

+ (NSCalendar *)db_currentCalendar
{
    static NSCalendar *sharedCalendar = nil;
    if (!sharedCalendar)
        sharedCalendar = [NSCalendar autoupdatingCurrentCalendar];
    return sharedCalendar;
}

- (NSString *)db_stringWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateStyle = dateStyle;
    formatter.timeStyle = timeStyle;
    return [formatter stringFromDate:self];
}

#pragma mark - Decomposing Dates 分解的日期
- (NSInteger)db_nearestHour
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + DB_D_MINUTE * 30;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components = [[NSDate db_currentCalendar] components:NSCalendarUnitHour fromDate:newDate];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components = [[NSDate db_currentCalendar] components:NSHourCalendarUnit fromDate:newDate];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components =  [[NSDate db_currentCalendar] components:NSHourCalendarUnit fromDate:newDate];
#endif
    return components.hour;
}

#pragma mark - short time 格式化的时间
- (NSString *)db_shortString
{
    return [self db_stringWithDateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle];
}

- (NSString *)db_shortTimeString
{
    return [self db_stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterShortStyle];
}

- (NSString *)db_shortDateString
{
    return [self db_stringWithDateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterNoStyle];
}

- (NSString *)db_mediumString
{
    return [self db_stringWithDateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterMediumStyle];
}

- (NSString *)db_mediumTimeString
{
    return [self db_stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterMediumStyle];
}

- (NSString *)db_mediumDateString
{
    return [self db_stringWithDateStyle:NSDateFormatterMediumStyle  timeStyle:NSDateFormatterNoStyle];
}

- (NSString *)db_longString
{
    return [self db_stringWithDateStyle:NSDateFormatterLongStyle timeStyle:NSDateFormatterLongStyle];
}

- (NSString *)db_longTimeString
{
    return [self db_stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterLongStyle];
}

- (NSString *)db_longDateString
{
    return [self db_stringWithDateStyle:NSDateFormatterLongStyle  timeStyle:NSDateFormatterNoStyle];
}

#pragma mark - 从当前日期相对日期时间
+ (NSDate *)db_dateWithDaysFromNow:(NSInteger)days
{
    return [[NSDate date] db_dateByAddingDays:days];
}

+ (NSDate *)db_dateWithDaysBeforeNow:(NSInteger)days
{
    return [[NSDate date] db_dateBySubtractingDays:days];
}

+ (NSDate *)db_dateTomorrow
{
    return [NSDate db_dateWithDaysFromNow:1];
}

+ (NSDate *)db_dateYesterday
{
    return [NSDate db_dateWithDaysBeforeNow:1];
}

+ (NSDate *)db_dateWithHoursFromNow:(NSInteger)dHours
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + DB_D_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

+ (NSDate *)db_dateWithHoursBeforeNow:(NSInteger)dHours
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - DB_D_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

+ (NSDate *)db_dateWithMinutesFromNow:(NSInteger)dMinutes
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + DB_D_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

+ (NSDate *)db_dateWithMinutesBeforeNow:(NSInteger)dMinutes
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - DB_D_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

#pragma mark - Comparing dates 比较时间
- (BOOL)db_isEqualToDateIgnoringTime:(NSDate *)aDate
{
    NSDateComponents *components1 = [[NSDate db_currentCalendar] components:DB_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    NSDateComponents *components2 = [[NSDate db_currentCalendar] components:DB_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:aDate];
    return ((components1.year == components2.year) &&
            (components1.month == components2.month) &&
            (components1.day == components2.day));
}

- (BOOL)db_isToday
{
    return [self db_isEqualToDateIgnoringTime:[NSDate date]];
}

- (BOOL)db_isTomorrow
{
    return [self db_isEqualToDateIgnoringTime:[NSDate db_dateTomorrow]];
}

- (BOOL)db_isYesterday
{
    return [self db_isEqualToDateIgnoringTime:[NSDate db_dateYesterday]];
}

// This hard codes the assumption that a week is 7 days
- (BOOL)db_isSameWeekAsDate:(NSDate *)aDate
{
    NSDateComponents *components1 = [[NSDate db_currentCalendar] components:DB_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:self];
    NSDateComponents *components2 = [[NSDate db_currentCalendar] components:DB_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:aDate];
    
    // Must be same week. 12/31 and 1/1 will both be week "1" if they are in the same week
    if (components1.weekOfYear != components2.weekOfYear) return NO;
    
    // Must have a time interval under 1 week. Thanks @aclark
    return (fabs([self timeIntervalSinceDate:aDate]) < DB_D_WEEK);
    
}

- (BOOL)db_isThisWeek
{
    return [self db_isSameWeekAsDate:[NSDate date]];
}

- (BOOL)db_isNextWeek
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] + DB_D_WEEK;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return [self db_isSameWeekAsDate:newDate];
}

- (BOOL)db_isLastWeek
{
    NSTimeInterval aTimeInterval = [[NSDate date] timeIntervalSinceReferenceDate] - DB_D_WEEK;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return [self db_isSameWeekAsDate:newDate];
}

- (BOOL)db_isSameMonthAsDate:(NSDate *)aDate
{
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components1;
    NSDateComponents *components2;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components1 = [[NSDate db_currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:self];
        components2 = [[NSDate db_currentCalendar] components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:aDate];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components1 = [[NSDate db_currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit fromDate:self];
        components2 = [[NSDate db_currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit fromDate:aDate];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components1 = [[NSDate db_currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit fromDate:self];
    NSDateComponents *components2 = [[NSDate db_currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit fromDate:aDate];
#endif
    
    return ((components1.month == components2.month) &&
            (components1.year == components2.year));
}

- (BOOL)db_isThisMonth
{
    return [self db_isSameMonthAsDate:[NSDate date]];
}

- (BOOL)db_isLastMonth
{
    return [self db_isSameMonthAsDate:[[NSDate date] db_dateBySubtractingMonths:1]];
}

- (BOOL)db_isNextMonth
{
    return [self db_isSameMonthAsDate:[[NSDate date] db_dateByAddingMonths:1]];
}

- (BOOL)db_isSameYearAsDate:(NSDate *)aDate
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components1;
    NSDateComponents *components2;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components1 = [[NSDate db_currentCalendar] components:NSCalendarUnitYear fromDate:self];
        components2 = [[NSDate db_currentCalendar] components:NSCalendarUnitYear fromDate:aDate];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components1 = [[NSDate db_currentCalendar] components:NSYearCalendarUnit fromDate:self];
        components2 = [[NSDate db_currentCalendar] components:NSYearCalendarUnit  fromDate:aDate];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components1 = [[NSDate db_currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit fromDate:self];
    NSDateComponents *components2 = [[NSDate db_currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit fromDate:aDate];
#endif
    return (components1.year == components2.year);
}

- (BOOL)db_isThisYear
{
    return [self db_isSameYearAsDate:[NSDate date]];
}

- (BOOL)db_isNextYear
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components1;
    NSDateComponents *components2;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components1 = [[NSDate db_currentCalendar] components:NSCalendarUnitYear fromDate:self];
        components2 = [[NSDate db_currentCalendar] components:NSCalendarUnitYear fromDate:[NSDate date]];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components1 = [[NSDate db_currentCalendar] components:NSYearCalendarUnit fromDate:self];
        components2 = [[NSDate db_currentCalendar] components:NSYearCalendarUnit  fromDate:[NSDate date]];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components1 = [[NSDate db_currentCalendar] components:NSYearCalendarUnit fromDate:self];
    NSDateComponents *components2 = [[NSDate db_currentCalendar] components:NSYearCalendarUnit fromDate:[NSDate date]];
#endif
    
    return (components1.year == (components2.year + 1));
}

- (BOOL)db_isLastYear
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components1;
    NSDateComponents *components2;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components1 = [[NSDate db_currentCalendar] components:NSCalendarUnitYear fromDate:self];
        components2 = [[NSDate db_currentCalendar] components:NSCalendarUnitYear fromDate:[NSDate date]];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components1 = [[NSDate db_currentCalendar] components:NSYearCalendarUnit fromDate:self];
        components2 = [[NSDate db_currentCalendar] components:NSYearCalendarUnit  fromDate:[NSDate date]];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components1 = [[NSDate db_currentCalendar] components:NSYearCalendarUnit fromDate:self];
    NSDateComponents *components2 = [[NSDate db_currentCalendar] components:NSYearCalendarUnit fromDate:[NSDate date]];
#endif
    return (components1.year == (components2.year - 1));
}

- (BOOL)db_isEarlierThanDate:(NSDate *)aDate
{
    return ([self compare:aDate] == NSOrderedAscending);
}

- (BOOL)db_isLaterThanDate:(NSDate *)aDate
{
    return ([self compare:aDate] == NSOrderedDescending);
}

- (BOOL)db_isInFuture
{
    return ([self db_isLaterThanDate:[NSDate date]]);
}

- (BOOL)db_isInPast
{
    return ([self db_isEarlierThanDate:[NSDate date]]);
}

- (BOOL)db_isTypicallyWeekend
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components = [[NSDate db_currentCalendar] components:NSCalendarUnitWeekday | NSCalendarUnitMonth fromDate:self];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components = [[NSDate db_currentCalendar] components:NSWeekdayCalendarUnit fromDate:self];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components = [[NSDate db_currentCalendar] components:NSWeekdayCalendarUnit fromDate:self];
#endif
    if ((components.weekday == 1) ||
        (components.weekday == 7))
        return YES;
    return NO;
}

- (BOOL)db_isTypicallyWorkday
{
    return ![self db_isTypicallyWeekend];
}

#pragma mark ---- Adjusting dates 调节时间
- (NSDate *)db_dateByAddingYears:(NSInteger)dYears
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setYear:dYears];
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

- (NSDate *)db_dateBySubtractingYears:(NSInteger)dYears
{
    return [self db_dateByAddingYears:-dYears];
}

- (NSDate *)db_dateByAddingMonths:(NSInteger)dMonths
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setMonth:dMonths];
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

- (NSDate *)db_dateBySubtractingMonths:(NSInteger)dMonths
{
    return [self db_dateByAddingMonths:-dMonths];
}

- (NSDate *)db_dateBySubtractingDays:(NSInteger)dDays
{
    return [self db_dateByAddingDays: (dDays * -1)];
}

- (NSDate *)db_dateByAddingHours:(NSInteger)dHours
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + DB_D_HOUR * dHours;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)db_dateBySubtractingHours:(NSInteger)dHours
{
    return [self db_dateByAddingHours: (dHours * -1)];
}

- (NSDate *)db_dateByAddingMinutes:(NSInteger)dMinutes
{
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + DB_D_MINUTE * dMinutes;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return newDate;
}

- (NSDate *)db_dateBySubtractingMinutes:(NSInteger)dMinutes
{
    return [self db_dateByAddingMinutes: (dMinutes * -1)];
}

- (NSDateComponents *)db_componentsWithOffsetFromDate:(NSDate *)aDate
{
    NSDateComponents *dTime = [[NSDate db_currentCalendar] components:DB_NSDATE_UTILITIES_COMPONENT_FLAGS fromDate:aDate toDate:self options:0];
    return dTime;
}

#pragma mark - 时间间隔
- (NSInteger)db_minutesAfterDate:(NSDate *)aDate
{
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger) (ti / DB_D_MINUTE);
}

- (NSInteger)db_minutesBeforeDate:(NSDate *)aDate
{
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger) (ti / DB_D_MINUTE);
}

- (NSInteger)db_hoursAfterDate:(NSDate *)aDate
{
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger) (ti / DB_D_HOUR);
}

- (NSInteger)db_hoursBeforeDate:(NSDate *)aDate
{
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger) (ti / DB_D_HOUR);
}

- (NSInteger)db_daysAfterDate:(NSDate *)aDate
{
    NSTimeInterval ti = [self timeIntervalSinceDate:aDate];
    return (NSInteger) (ti / DB_D_DAY);
}

- (NSInteger)db_daysBeforeDate:(NSDate *)aDate
{
    NSTimeInterval ti = [aDate timeIntervalSinceDate:self];
    return (NSInteger) (ti / DB_D_DAY);
}

- (NSInteger)db_distanceDaysToDate:(NSDate *)anotherDate
{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components = [[NSDate db_currentCalendar] components:NSCalendarUnitDay fromDate:self toDate:anotherDate options:0];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components = [[NSDate db_currentCalendar] components:NSDayCalendarUnit fromDate:self toDate:anotherDate options:0];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components = [[NSDate db_currentCalendar] components:NSDayCalendarUnit fromDate:self toDate:anotherDate options:0]
#endif
    
    return components.day;
}

- (NSInteger)db_distanceMonthsToDate:(NSDate *)anotherDate{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components = [[NSDate db_currentCalendar] components:NSCalendarUnitMonth fromDate:self toDate:anotherDate options:0];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components = [[NSDate db_currentCalendar] components:NSMonthCalendarUnit fromDate:self toDate:anotherDate options:0];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components = [[NSDate db_currentCalendar] components:NSMonthCalendarUnit fromDate:self toDate:anotherDate options:0]
#endif
    return components.month;
}

- (NSInteger)db_distanceYearsToDate:(NSDate *)anotherDate{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    NSDateComponents *components;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f){
        components = [[NSDate db_currentCalendar] components:NSCalendarUnitYear fromDate:self toDate:anotherDate options:0];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        components = [[NSDate db_currentCalendar] components:NSYearCalendarUnit fromDate:self toDate:anotherDate options:0];
#pragma clang diagnostic pop
    }
#else
    NSDateComponents *components = [[NSDate db_currentCalendar] components:NSYearCalendarUnit fromDate:self toDate:anotherDate options:0]
#endif
    return components.year;
}

@end

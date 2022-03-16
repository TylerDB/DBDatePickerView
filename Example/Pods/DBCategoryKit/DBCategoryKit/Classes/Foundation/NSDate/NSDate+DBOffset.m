//
//  NSDate+dbOffset.m
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/3.
//  Copyright © 2019年 DB. All rights reserved.
//

#import "NSDate+DBOffset.h"

@implementation NSDate (dbOffset)

- (NSDate *)db_offsetYears:(int)numYears {
    return [NSDate db_offsetYears:numYears fromDate:self];
}

+ (NSDate *)db_offsetYears:(int)numYears fromDate:(NSDate *)fromDate {
    return [self db_offsetYears:numYears months:0 days:0 hours:0 minutes:0 seconds:0 fromDate:fromDate];
}

- (NSDate *)db_offsetMonths:(int)numMonths {
    return [NSDate db_offsetMonths:numMonths fromDate:self];
}

+ (NSDate *)db_offsetMonths:(int)numMonths fromDate:(NSDate *)fromDate {
    return [self db_offsetYears:0 months:numMonths days:0 hours:0 minutes:0 seconds:0 fromDate:fromDate];
}

- (NSDate *)db_offsetDays:(int)numDays {
    return [NSDate db_offsetDays:numDays fromDate:self];
}

+ (NSDate *)db_offsetDays:(int)numDays fromDate:(NSDate *)fromDate {
    return [self db_offsetYears:0 months:0 days:numDays hours:0 minutes:0 seconds:0 fromDate:fromDate];
}

- (NSDate *)db_offsetHours:(int)numHours {
    return [NSDate db_offsetHours:numHours fromDate:self];
}

+ (NSDate *)db_offsetHours:(int)numHours fromDate:(NSDate *)fromDate {
    return [self db_offsetYears:0 months:0 days:0 hours:numHours minutes:0 seconds:0 fromDate:fromDate];
}

- (NSDate *)db_offsetMinutes:(int)numMinutes {
    return [NSDate db_offsetMinutes:numMinutes fromDate:self];
}

+ (NSDate *)db_offsetMinutes:(int)numMinutes fromDate:(NSDate *)fromDate {
    return [self db_offsetYears:0 months:0 days:0 hours:0 minutes:numMinutes seconds:0 fromDate:fromDate];
}

- (NSDate *)db_offsetSeconds:(int)numSeconds {
    return [NSDate db_offsetSeconds:numSeconds fromDate:self];
}

+ (NSDate *)db_offsetSeconds:(int)numSeconds fromDate:(NSDate *)fromDate {
    return [self db_offsetYears:0 months:0 days:0 hours:0 minutes:0 seconds:numSeconds fromDate:fromDate];
}

#pragma mark - 时间间隔

- (NSDate *_Nullable)db_startOfCurrentMinute {
    return [self db_secondsDurationsAtCurrentMinute].firstObject;
}

- (NSDate *_Nullable)db_endOfCurrentMinute {
    return [self db_secondsDurationsAtCurrentMinute].lastObject;
}

- (NSArray<NSDate*> *)db_secondsDurationsAtCurrentMinute {
    return [self datesRangeOfUnit:NSCalendarUnitMinute];
}

- (NSDate *_Nullable)db_startOfCurrentHour {
    return [self db_minuteDurationsAtCurrentHour].firstObject;
}

- (NSDate *_Nullable)db_endOfCurrentHour {
    return [self db_minuteDurationsAtCurrentHour].lastObject;
}

- (NSArray<NSDate*> *)db_minuteDurationsAtCurrentHour {
    return [self datesRangeOfUnit:NSCalendarUnitHour];
}

/// 当天开始，以零时为准
- (NSDate *_Nullable)db_startOfCurrentDay {
    return [self db_hourDurationsAtCurrentDay].firstObject;
}

/// 当天结束，以23:59:59为止
- (NSDate *_Nullable)db_endOfCurrentDay {
    return [self db_hourDurationsAtCurrentDay].lastObject;
}

- (NSArray<NSDate*> *_Nullable)db_hourDurationsAtCurrentDay {
    return [self datesRangeOfUnit:NSCalendarUnitDay];
}

/// 月份开始
- (NSDate *_Nullable)db_startOfCurrentMonth {
    return [self db_dayDurationsAtCurrentMonth].firstObject;
}

/// 月份结束
- (NSDate *_Nullable)db_endOfCurrentMonth {
    return [self db_dayDurationsAtCurrentMonth].lastObject;
}

/// 当前月份月份间隔，如12月的间隔为12月1日-12月30日
- (NSArray<NSDate*> *_Nullable)db_dayDurationsAtCurrentMonth {
    return [self datesRangeOfUnit:NSCalendarUnitMonth];
}

- (NSDate *)db_startOfCurrentYear {
    return [self db_monthDurationsAtCurrentYear].firstObject;
}

- (NSDate *)db_endOfCurrentYear {
    return [self db_monthDurationsAtCurrentYear].lastObject;
}

- (NSArray<NSDate*> *)db_monthDurationsAtCurrentYear {
    return [self datesRangeOfUnit:NSCalendarUnitYear];
}

/// 判断当前日期是否被包含在时间间隔内
/// @param startDate 开始时间
/// @param endDate 结束时间
- (BOOL)db_containtsFromStartDate:(NSDate *_Nonnull)startDate endDate:(NSDate *_Nonnull)endDate {
    return [self compare:startDate] == NSOrderedDescending && [self compare:endDate] == NSOrderedAscending;
}

#pragma mark - Private Methods

+ (NSDate *)db_offsetYears:(int)numYears months:(int)numMonths days:(int)numDays hours:(int)numHours minutes:(int)numMinutes seconds:(int)numSeconds fromDate:(NSDate *)fromDate {
    if (fromDate == nil) {
        return nil;
    }
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
#else
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
#endif
    
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setYear:numYears];
    [offsetComponents setMonth:numMonths];
    [offsetComponents setDay:numDays];
    [offsetComponents setHour:numHours];
    [offsetComponents setMinute:numMinutes];
    [offsetComponents setSecond:numSeconds];
    
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:fromDate
                                     options:0];
}

/// 计算时间开始
/// @param unit 年、月、日
- (NSArray <NSDate*> *)datesRangeOfUnit:(NSCalendarUnit)unit {
    double interval = 0;
    NSDate *firstDate, *lastDate;
    BOOL bl = [[NSCalendar currentCalendar] rangeOfUnit:unit startDate:&firstDate interval:&interval forDate:self];
    if (bl) {
        lastDate = [firstDate dateByAddingTimeInterval: interval -1];
    }
    if (lastDate && firstDate) {
        return @[firstDate, lastDate];
    }
    return nil;
}


@end

//
//  NSDate+dbOffset.h
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/3.
//  Copyright © 2019年 DB. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (DBOffset)

/// offset years from the current date
/// @param numYears years
- (NSDate *)db_offsetYears:(int)numYears;

/// offset years from the specific date, if specific date is nil, return nil
/// @param numYears years
/// @param fromDate specific date
+ (NSDate *)db_offsetYears:(int)numYears fromDate:(NSDate *)fromDate;

/// offset months from the current date
/// @param numMonths months
- (NSDate *)db_offsetMonths:(int)numMonths;

/// offset months from the specific date, if specific date is nil, return nil
/// @param numMonths months
/// @param fromDate specific date
+ (NSDate *)db_offsetMonths:(int)numMonths fromDate:(NSDate *)fromDate;

/// offset days from the current date
/// @param numDays days
- (NSDate *)db_offsetDays:(int)numDays;

/// offset days from the specific date, if specific date is nil, return nil
/// @param numDays days
/// @param fromDate specific date
+ (NSDate *)db_offsetDays:(int)numDays fromDate:(NSDate *)fromDate;

/// offset hours from the current date
/// @param numHours hours
- (NSDate *)db_offsetHours:(int)numHours;

/// offset hours from the specific date, if specific date is nil, return nil
/// @param numHours hours
/// @param fromDate specific date
+ (NSDate *)db_offsetHours:(int)numHours fromDate:(NSDate *)fromDate;

/// offset minutes from the current date
/// @param numMinutes minutes
- (NSDate *)db_offsetMinutes:(int)numMinutes;

/// offset minutes from the specific date, if specific date is nil, return nil
/// @param numMinutes minutes
/// @param fromDate specific date
+ (NSDate *)db_offsetMinutes:(int)numMinutes fromDate:(NSDate *)fromDate;

/// offset seconds from the current date
/// @param numSeconds seconds
- (NSDate *)db_offsetSeconds:(int)numSeconds;

/// offset seconds from the specific date, if specific date is nil, return nil
/// @param numSeconds seconds
/// @param fromDate specific date
+ (NSDate *)db_offsetSeconds:(int)numSeconds fromDate:(NSDate *)fromDate;

#pragma mark - time interval

/// The start of the current minute, i.e. 0 seconds
- (NSDate *_Nullable)db_startOfCurrentMinute;

/// The end of the current minute, i.e. 59 seconds
- (NSDate *_Nullable)db_endOfCurrentMinute;

/// Range of the current minute, including start and end
- (NSArray<NSDate*> *_Nullable)db_secondsDurationsAtCurrentMinute;

/// The start of the current hour, i.e. 0 minutes and 0 seconds
- (NSDate *_Nullable)db_startOfCurrentHour;

/// The end of the current hour, i.e. 59 minutes and 59 seconds
- (NSDate *_Nullable)db_endOfCurrentHour;

/// Range of the current hour, including start and end
- (NSArray<NSDate*> *_Nullable)db_minuteDurationsAtCurrentHour;

/// The start of the current day, i.e. 00:00:00
- (NSDate *_Nullable)db_startOfCurrentDay;

/// The end of the  current day, i.e. 23:59:59
- (NSDate *_Nullable)db_endOfCurrentDay;

/// Range for the current day, including start and end
- (NSArray<NSDate*> *_Nullable)db_hourDurationsAtCurrentDay;

/// The start of the current month, e.g. January 1st 00:00:00
- (NSDate *_Nullable)db_startOfCurrentMonth;

/// The end of the current month, e.g. January 31st 23:59:59
- (NSDate *_Nullable)db_endOfCurrentMonth;

/// Range for the current month, including start and end
- (NSArray<NSDate*> *_Nullable)db_dayDurationsAtCurrentMonth;

/// The start of the current year, i.e. January 1st 00:00:00
- (NSDate *_Nullable)db_startOfCurrentYear;

/// The end of the current year, i.e. December 31st 23:59:59
- (NSDate *_Nullable)db_endOfCurrentYear;

/// Range for the current year, including start and end
- (NSArray<NSDate*> *_Nullable)db_monthDurationsAtCurrentYear;

/// Determines whether the current date is included in the specified time interval
/// @param startDate specified start date
/// @param endDate specified end date
- (BOOL)db_containtsFromStartDate:(NSDate *_Nonnull)startDate endDate:(NSDate *_Nonnull)endDate;

@end

NS_ASSUME_NONNULL_END

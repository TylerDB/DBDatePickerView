//
//  NSDate+DBExtension.m
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/3.
//  Copyright © 2019年 DB. All rights reserved.
//

#import "NSDate+DBExtension.h"
#import <objc/runtime.h>

@implementation NSDate (DBExtension)

- (NSDateComponents *)db_dateComponents {
    NSDateComponents *obj = objc_getAssociatedObject(self, _cmd);
    if (!obj) {
        NSCalendarUnit unit = NSCalendarUnitEra|NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond|NSCalendarUnitWeekday|NSCalendarUnitWeekdayOrdinal|NSCalendarUnitQuarter|NSCalendarUnitWeekOfMonth|NSCalendarUnitWeekOfYear|NSCalendarUnitYearForWeekOfYear|NSCalendarUnitNanosecond|NSCalendarUnitTimeZone|NSCalendarUnitCalendar;
        
        obj = [[NSCalendar autoupdatingCurrentCalendar] components:unit fromDate:self];
        objc_setAssociatedObject(self, _cmd, obj, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return obj;
}

//- (NSInteger)ty_year {
//    return self.db_dateComponents.year;
//}
//- (NSInteger)ty_month {
//    return self.ty_dateComponents.month;
//}
//- (NSInteger)ty_day {
//    return self.ty_dateComponents.day;
//}
//- (NSInteger)ty_weekday {
//    return self.ty_dateComponents.weekday;
//}
//- (NSInteger)ty_hour {
//    return self.ty_dateComponents.hour;
//}
//- (NSInteger)ty_minute {
//    return self.ty_dateComponents.minute;
//}
//- (NSInteger)ty_second {
//    return self.ty_dateComponents.second;
//}

- (NSUInteger)db_day {
    return self.db_dateComponents.day;
//    return [NSDate db_day:self];
}

- (NSUInteger)db_month {
    return self.db_dateComponents.month;
//    return [NSDate db_month:self];
}

- (NSUInteger)db_year {
    return self.db_dateComponents.year;
//    return [NSDate db_year:self];
}

- (NSUInteger)db_hour {
    return self.db_dateComponents.hour;
//    return [NSDate db_hour:self];
}

- (NSUInteger)db_minute {
    return self.db_dateComponents.minute;
//    return [NSDate db_minute:self];
}

- (NSUInteger)db_second {
    return self.db_dateComponents.second;
//    return [NSDate db_second:self];
}

+ (NSUInteger)db_day:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitDay) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSDayCalendarUnit) fromDate:date];
#endif
    
    return [dayComponents day];
}

+ (NSUInteger)db_month:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitMonth) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSMonthCalendarUnit) fromDate:date];
#endif
    
    return [dayComponents month];
}

+ (NSUInteger)db_year:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitYear) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSYearCalendarUnit) fromDate:date];
#endif
    
    return [dayComponents year];
}

+ (NSUInteger)db_hour:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitHour) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSHourCalendarUnit) fromDate:date];
#endif
    
    return [dayComponents hour];
}

+ (NSUInteger)db_minute:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitMinute) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSMinuteCalendarUnit) fromDate:date];
#endif
    
    return [dayComponents minute];
}

+ (NSUInteger)db_second:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    // NSDayCalendarUnit
    NSDateComponents *dayComponents = [calendar components:(NSCalendarUnitSecond) fromDate:date];
#else
    NSDateComponents *dayComponents = [calendar components:(NSSecondCalendarUnit) fromDate:date];
#endif
    
    return [dayComponents second];
}
- (NSUInteger)db_daysInYear {
    return [NSDate db_daysInYear:self];
}

+ (NSUInteger)db_daysInYear:(NSDate *)date {
    return [self db_isLeapYear:date] ? 366 : 365;
}

- (BOOL)db_isLeapYear {
    return [NSDate db_isLeapYear:self];
}

+ (BOOL)db_isLeapYear:(NSDate *)date {
    NSUInteger year = [date db_year];
    if ((year % 4  == 0 && year % 100 != 0) || year % 400 == 0) {
        return YES;
    }
    return NO;
}

- (NSString *)db_formatYMD {
    return [NSDate db_formatYMD:self];
}

+ (NSString *)db_formatYMD:(NSDate *)date {
    return [NSString stringWithFormat:@"%zd-%zd-%zd",[date db_year],[date db_month], [date db_day]];
}

- (NSUInteger)db_weeksOfMonth {
    return [NSDate db_weeksOfMonth:self];
}

+ (NSUInteger)db_weeksOfMonth:(NSDate *)date {
    return [[date db_lastdayOfMonth] db_weekOfYear] - [[date db_begindayOfMonth] db_weekOfYear] + 1;
}

- (NSUInteger)db_weekOfYear {
    return [NSDate db_weekOfYear:self];
}

+ (NSUInteger)db_weekOfYear:(NSDate *)date {
    NSUInteger i;
    NSUInteger year = [date db_year];
    
    //    NSDate *lastdate = [date db_lastdayOfMonth];
    
    for (i = 1;[[date db_dateAfterDay:-7 * i] db_year] == year; i++) {
        
    }
    //    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    //    [dateFormatter setDateFormat:@"'公元前/后:'G  '年份:'u'='yyyy'='yy '季度:'q'='qqq'='qqqq '月份:'M'='MMM'='MMMM '今天是今年第几周:'w '今天是本月第几周:'W  '今天是今天第几天:'D '今天是本月第几天:'d '星期:'c'='ccc'='cccc '上午/下午:'a '小时:'h'='H '分钟:'m '秒:'s '毫秒:'SSS  '这一天已过多少毫秒:'A  '时区名称:'zzzz'='vvvv '时区编号:'Z "];
    //    NSLog(@"%@", [dateFormatter stringFromDate:[NSDate date]]);
    return i;
}

- (NSDate *)db_dateAfterDay:(NSUInteger)day {
    return [NSDate db_dateAfterDate:self day:day];
}

+ (NSDate *)db_dateAfterDate:(NSDate *)date day:(NSInteger)day {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    [componentsToAdd setDay:day];
    
    NSDate *dateAfterDay = [calendar dateByAddingComponents:componentsToAdd toDate:date options:0];
    
    return dateAfterDay;
}

- (NSDate *)db_dateAfterMonth:(NSUInteger)month {
    return [NSDate db_dateAfterDate:self month:month];
}

+ (NSDate *)db_dateAfterDate:(NSDate *)date month:(NSInteger)month {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *componentsToAdd = [[NSDateComponents alloc] init];
    [componentsToAdd setMonth:month];
    NSDate *dateAfterMonth = [calendar dateByAddingComponents:componentsToAdd toDate:date options:0];
    
    return dateAfterMonth;
}

- (NSDate *)db_begindayOfMonth {
    return [NSDate db_begindayOfMonth:self];
}

+ (NSDate *)db_begindayOfMonth:(NSDate *)date {
    return [self db_dateAfterDate:date day:-[date db_day] + 1];
}

- (NSDate *)db_lastdayOfMonth {
    return [NSDate db_lastdayOfMonth:self];
}

+ (NSDate *)db_lastdayOfMonth:(NSDate *)date {
    NSDate *lastDate = [self db_begindayOfMonth:date];
    return [[lastDate db_dateAfterMonth:1] db_dateAfterDay:-1];
}

- (NSUInteger)db_daysAgo {
    return [NSDate db_daysAgo:self];
}

+ (NSUInteger)db_daysAgo:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    NSDateComponents *components = [calendar components:(NSCalendarUnitDay)
                                               fromDate:date
                                                 toDate:[NSDate date]
                                                options:0];
#else
    NSDateComponents *components = [calendar components:(NSDayCalendarUnit)
                                               fromDate:date
                                                 toDate:[NSDate date]
                                                options:0];
#endif
    
    return [components day];
}

- (NSInteger)db_weekday {
    return [NSDate db_weekday:self];
}

+ (NSInteger)db_weekday:(NSDate *)date {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [gregorian components:(NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitWeekday) fromDate:date];
    NSInteger weekday = [comps weekday];
    
    return weekday;
}

- (NSString *)db_dayFromWeekday {
    return [NSDate db_dayFromWeekday:self];
}

+ (NSString *)db_dayFromWeekday:(NSDate *)date {
    switch([date db_weekday]) {
        case 1:
            return @"星期天";
            break;
        case 2:
            return @"星期一";
            break;
        case 3:
            return @"星期二";
            break;
        case 4:
            return @"星期三";
            break;
        case 5:
            return @"星期四";
            break;
        case 6:
            return @"星期五";
            break;
        case 7:
            return @"星期六";
            break;
        default:
            break;
    }
    return @"";
}

- (BOOL)db_isSameDay:(NSDate *)anotherDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components1 = [calendar components:(NSCalendarUnitYear
                                                          | NSCalendarUnitMonth
                                                          | NSCalendarUnitDay)
                                                fromDate:self];
    NSDateComponents *components2 = [calendar components:(NSCalendarUnitYear
                                                          | NSCalendarUnitMonth
                                                          | NSCalendarUnitDay)
                                                fromDate:anotherDate];
    return ([components1 year] == [components2 year]
            && [components1 month] == [components2 month]
            && [components1 day] == [components2 day]);
}

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
+ (NSString *)db_monthWithMonthNumber:(NSInteger)month {
    switch(month) {
        case 1:
            return @"January";
            break;
        case 2:
            return @"February";
            break;
        case 3:
            return @"March";
            break;
        case 4:
            return @"April";
            break;
        case 5:
            return @"May";
            break;
        case 6:
            return @"June";
            break;
        case 7:
            return @"July";
            break;
        case 8:
            return @"August";
            break;
        case 9:
            return @"September";
            break;
        case 10:
            return @"October";
            break;
        case 11:
            return @"November";
            break;
        case 12:
            return @"December";
            break;
        default:
            break;
    }
    return @"";
}

+ (NSString *)db_stringWithDate:(NSDate *)date format:(NSString *)format {
    return [date db_stringWithFormat:format];
}

- (NSString *)db_stringWithFormat:(NSString *)format {
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:format];
    
    NSString *retStr = [outputFormatter stringFromDate:self];
    
    return retStr;
}

+ (NSDate *)db_dateWithString:(NSString *)string format:(NSString *)format {
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:format];
    
    NSDate *date = [inputFormatter dateFromString:string];
    
    return date;
}

- (NSUInteger)db_daysInMonth:(NSUInteger)month {
    return [NSDate db_daysInMonth:self month:month];
}

+ (NSUInteger)db_daysInMonth:(NSDate *)date month:(NSUInteger)month {
    switch (month) {
        case 1: case 3: case 5: case 7: case 8: case 10: case 12:
            return 31;
        case 2:
            return [date db_isLeapYear] ? 29 : 28;
    }
    return 30;
}

- (NSUInteger)db_daysInMonth {
    return [NSDate db_daysInMonth:self];
}

+ (NSUInteger)db_daysInMonth:(NSDate *)date {
    return [self db_daysInMonth:date month:[date db_month]];
}

- (NSString *)db_timeInfo {
    return [NSDate db_timeInfoWithDate:self];
}

+ (NSString *)db_timeInfoWithDate:(NSDate *)date {
    return [self db_timeInfoWithDateString:[self db_stringWithDate:date format:[self db_ymdHmsFormat]]];
}

+ (NSString *)db_timeInfoWithDateString:(NSString *)dateString {
    NSDate *date = [self db_dateWithString:dateString format:[self db_ymdHmsFormat]];
    
    NSDate *curDate = [NSDate date];
    NSTimeInterval time = -[date timeIntervalSinceDate:curDate];
    
    int month = (int)([curDate db_month] - [date db_month]);
    int year = (int)([curDate db_year] - [date db_year]);
    int day = (int)([curDate db_day] - [date db_day]);
    
    NSTimeInterval retTime = 1.0;
    if (time < 3600) { // 小于一小时
        retTime = time / 60;
        retTime = retTime <= 0.0 ? 1.0 : retTime;
        //        return [NSString stringWithFormat:@"%.0f分钟前", retTime];
        return retTime < 1.0 ? @"刚刚" : [NSString stringWithFormat:@"%.0f分钟前", retTime];
        
    } else if (time < 3600 * 24) { // 小于一天，也就是今天
        retTime = time / 3600;
        retTime = retTime <= 0.0 ? 1.0 : retTime;
        return [NSString stringWithFormat:@"%.0f小时前", retTime];
    } else if (time < 3600 * 24 * 2) {
        return @"昨天";
    }
    // 第一个条件是同年，且相隔时间在一个月内
    // 第二个条件是隔年，对于隔年，只能是去年12月与今年1月这种情况
    else if ((abs(year) == 0 && abs(month) <= 1)
             || (abs(year) == 1 && [curDate db_month] == 1 && [date db_month] == 12)) {
        int retDay = 0;
        if (year == 0) { // 同年
            if (month == 0) { // 同月
                retDay = day;
            }
        }
        
        if (retDay <= 0) {
            // 获取发布日期中，该月有多少天
            int totalDays = (int)[self db_daysInMonth:date month:[date db_month]];
            
            // 当前天数 + （发布日期月中的总天数-发布日期月中发布日，即等于距离今天的天数）
            retDay = (int)[curDate db_day] + (totalDays - (int)[date db_day]);
        }
        
        return [NSString stringWithFormat:@"%d天前", (abs)(retDay)];
    } else  {
        if (abs(year) <= 1) {
            if (year == 0) { // 同年
                return [NSString stringWithFormat:@"%d个月前", abs(month)];
            }
            
            // 隔年
            int month = (int)[curDate db_month];
            int preMonth = (int)[date db_month];
            if (month == 12 && preMonth == 12) {// 隔年，但同月，就作为满一年来计算
                return @"1年前";
            }
            return [NSString stringWithFormat:@"%d个月前", (abs)(12 - preMonth + month)];
        }
        
        return [NSString stringWithFormat:@"%d年前", abs(year)];
    }
    
    return @"1小时前";
}

- (NSString *)db_ymdFormat {
    return [NSDate db_ymdFormat];
}

- (NSString *)db_hmsFormat {
    return [NSDate db_hmsFormat];
}

- (NSString *)db_ymdHmsFormat {
    return [NSDate db_ymdHmsFormat];
}

+ (NSString *)db_ymdFormat {
    return @"yyyy-MM-dd";
}

+ (NSString *)db_hmsFormat {
    return @"HH:mm:ss";
}

+ (NSString *)db_ymdHmsFormat {
    return [NSString stringWithFormat:@"%@ %@", [self db_ymdFormat], [self db_hmsFormat]];
}

- (NSDate *)db_offsetYears:(int)numYears {
    return [NSDate db_offsetYears:numYears fromDate:self];
}

+ (NSDate *)db_offsetYears:(int)numYears fromDate:(NSDate *)fromDate {
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
    
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:fromDate
                                     options:0];
}

- (NSDate *)db_offsetMonths:(int)numMonths {
    return [NSDate db_offsetMonths:numMonths fromDate:self];
}

+ (NSDate *)db_offsetMonths:(int)numMonths fromDate:(NSDate *)fromDate {
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
    [offsetComponents setMonth:numMonths];
    
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:fromDate
                                     options:0];
}

- (NSDate *)db_offsetDays:(int)numDays {
    return [NSDate db_offsetDays:numDays fromDate:self];
}

+ (NSDate *)db_offsetDays:(int)numDays fromDate:(NSDate *)fromDate {
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
    [offsetComponents setDay:numDays];
    
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:fromDate
                                     options:0];
}

- (NSDate *)db_offsetHours:(int)hours {
    return [NSDate db_offsetHours:hours fromDate:self];
}

+ (NSDate *)db_offsetHours:(int)numHours fromDate:(NSDate *)fromDate {
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
    [offsetComponents setHour:numHours];
    
    return [gregorian dateByAddingComponents:offsetComponents
                                      toDate:fromDate
                                     options:0];
}

@end

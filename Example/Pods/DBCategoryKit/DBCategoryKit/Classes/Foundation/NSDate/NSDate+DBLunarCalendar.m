//
//  NSDate+DBLunarCalendar.m
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/3.
//  Copyright © 2019年 DB. All rights reserved.
//

#import "NSDate+DBLunarCalendar.h"

#define db_ChineseMonths @[@"正月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月",@"九月", @"十月", @"冬月", @"腊月"]

#define db_ChineseDays @[@"初一", @"初二", @"初三", @"初四", @"初五", @"初六", @"初七", @"初八", @"初九", @"初十",@"十一", @"十二", @"十三", @"十四", @"十五", @"十六", @"十七", @"十八", @"十九", @"二十", @"廿一", @"廿二", @"廿三", @"廿四", @"廿五", @"廿六", @"廿七", @"廿八", @"廿九", @"三十"]

#define db_ChineseYears  @[@"甲子", @"乙丑", @"丙寅", @"丁卯",  @"戊辰",  @"己巳",  @"庚午",  @"辛未",  @"壬申",  @"癸酉", @"甲戌",   @"乙亥",  @"丙子",  @"丁丑", @"戊寅",   @"己卯",  @"庚辰",  @"辛己",  @"壬午",  @"癸未", @"甲申",   @"乙酉",  @"丙戌",  @"丁亥",  @"戊子",  @"己丑",  @"庚寅",  @"辛卯",  @"壬辰",  @"癸巳", @"甲午",   @"乙未",  @"丙申",  @"丁酉",  @"戊戌",  @"己亥",  @"庚子",  @"辛丑",  @"壬寅",  @"癸丑", @"甲辰",   @"乙巳",  @"丙午",  @"丁未",  @"戊申",  @"己酉",  @"庚戌",  @"辛亥",  @"壬子",  @"癸丑",  @"甲寅",   @"乙卯",  @"丙辰",  @"丁巳",  @"戊午",  @"己未",  @"庚申",  @"辛酉",  @"壬戌",  @"癸亥"]

@implementation NSDate (DBLunarCalendar)

+ (NSCalendar *)db_chineseCalendar
{
    static NSCalendar *db_chineseCalendar_sharedCalendar = nil;
    if (!db_chineseCalendar_sharedCalendar)
        db_chineseCalendar_sharedCalendar =[[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    return db_chineseCalendar_sharedCalendar;
}

+ (NSString*)db_currentMDDateString{
    
    NSDate *date = [NSDate date];
    NSCalendar *chineseCalendar = [self db_chineseCalendar];
    
    NSDateComponents *components = [chineseCalendar components:NSCalendarUnitYear |NSCalendarUnitMonth | NSCalendarUnitDay fromDate:date];
    
    NSString *month = db_ChineseMonths[components.month -1];
    NSString *day  = db_ChineseDays[components.day -1];
    
    return [month stringByAppendingString:day];
}

+ (NSString*)db_currentYMDDateString{
    NSCalendar *chineseCalendar = [[self class] db_chineseCalendar];
    NSDate *date = [NSDate date];
    
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay;
    NSDateComponents *localeComp = [chineseCalendar components:unitFlags fromDate:date];
    
    NSLog(@"%zd_%zd_%zd",localeComp.year,localeComp.month,localeComp.day);
    
    NSString *y_str = [db_ChineseYears objectAtIndex:localeComp.year-1];
    NSString *m_str = [db_ChineseMonths objectAtIndex:localeComp.month-1];
    NSString *d_str = [db_ChineseDays objectAtIndex:localeComp.day-1];
    
    NSString *chineseCal_str =[NSString stringWithFormat:@"%@%@%@",y_str,m_str,d_str];
    
    return chineseCal_str;
}

+ (NSString *)db_currentWeekWithDateString:(NSString*)datestring{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [formatter dateFromString:datestring];
    return [self db_currentWeek:date];
}

+ (NSString *)db_currentWeek:(NSDate*)date{
    NSArray *weeks =@[@"星期",@"星期日",@"星期一", @"星期二", @"星期三",@"星期四", @"星期五", @"星期六"];
    
    NSCalendar *gregorian = [self db_chineseCalendar];
    NSDateComponents *comps = [gregorian components:NSCalendarUnitWeekday fromDate:date];
    
    int week = (int)comps.weekday;
    
    return weeks[week];
}

+ (NSString*)db_currentCapitalDateString{
    NSCalendar *gregorian = [NSCalendar currentCalendar];
    NSDateComponents *comps = [gregorian components:(NSCalendarUnitMonth| NSCalendarUnitDay) fromDate:[NSDate date]];
    
    NSArray *months = @[@"月",@"一月",@"二月",@"三月",@"四月",@"五月",@"六月",@"七月",@"八月",@"九月",@"十月",@"十一月",@"十二月"];
    
    NSArray *days = @[@"零",@"一", @"二", @"三", @"四", @"五", @"六", @"七", @"八", @"九", @"十",
                      @"十一", @"十二", @"十三", @"十四", @"十五", @"十六", @"十七", @"十八", @"十九", @"二十",
                      @"廿一", @"廿二", @"廿三", @"廿四", @"廿五", @"廿六", @"廿七", @"廿八", @"廿九", @"三十", @"三十一"];
    
    int day = (int)comps.day;
    int month = (int)comps.month;
    return [[months objectAtIndex:month] stringByAppendingString:[days objectAtIndex:day]];
}

@end

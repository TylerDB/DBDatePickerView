//
//  NSDateFormatter+DBExtension.h
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/3.
//  Copyright © 2019年 DB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (DBExtension)

+ (NSDateFormatter *)db_dateFormatterWithFormat:(NSString *)format;

+ (NSDateFormatter *)db_dateFormatterWithFormat:(NSString *)format timeZone:(NSTimeZone *)timeZone;

+ (NSDateFormatter *)db_dateFormatterWithFormat:(NSString *)format timeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale;

+ (NSDateFormatter *)db_dateFormatterWithDateStyle:(NSDateFormatterStyle)style;

+ (NSDateFormatter *)db_dateFormatterWithDateStyle:(NSDateFormatterStyle)style timeZone:(NSTimeZone *)timeZone;

+ (NSDateFormatter *)db_dateFormatterWithTimeStyle:(NSDateFormatterStyle)style;

+ (NSDateFormatter *)db_dateFormatterWithTimeStyle:(NSDateFormatterStyle)style timeZone:(NSTimeZone *)timeZone;

@end

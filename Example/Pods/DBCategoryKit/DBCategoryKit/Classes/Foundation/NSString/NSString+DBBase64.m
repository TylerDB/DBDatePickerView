//
//  NSString+DBBase64.m
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/5.
//  Copyright © 2019年 DB. All rights reserved.
//

#import "NSString+DBBase64.h"
#import <DBCategoryKit/NSData+DBBase64.h>

@implementation NSString (DBBase64)

+ (NSString *)db_stringWithBase64EncodedString:(NSString *)string
{
    NSData *data = [NSData db_dataWithBase64EncodedString:string];
    if (data)
    {
        return [[self alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return nil;
}

- (NSString *)db_base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    return [data db_base64EncodedStringWithWrapWidth:wrapWidth];
}

- (NSString *)db_base64EncodedString
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    return [data db_base64EncodedString];
}

- (NSString *)db_base64DecodedString
{
    return [NSString db_stringWithBase64EncodedString:self];
}

- (NSData *)db_base64DecodedData
{
    return [NSData db_dataWithBase64EncodedString:self];
}

@end

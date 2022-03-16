//
//  UIColor+DBPackage.m
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/27.
//  Copyright © 2018年 DB. All rights reserved.
//

#import "UIColor+DBPackage.h"

@implementation UIColor (DBPackage)

+ (UIColor*)db_colorWithRed:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue{
    return [UIColor db_colorWithRed:red green:green blue:blue alpha:1];
}

+ (UIColor *)db_colorWithRed:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue alpha:(CGFloat)alpha{
    return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha];
}

+ (UIColor *)db_colorWithHexString:(NSString *)string {
    
    return [UIColor db_colorWithHexString:string alpha:1.];
}

+ (UIColor *)db_colorWithHexString:(NSString *)string alpha:(CGFloat)alpha {
    
    NSString *trimString = string;
    
    NSRange range = [string rangeOfString:@"0X" options:NSCaseInsensitiveSearch];
    if (range.location == 0) {
        trimString = [string substringFromIndex:2];
    }
    
    if ([trimString isEqualToString:string]) {
        range = [string rangeOfString:@"#"];
        if (range.location != NSNotFound) {
            trimString = [string substringFromIndex:1];
        }
    }
    
    uint32_t rgb;
    NSScanner *scanner = [NSScanner scannerWithString:trimString];
    [scanner scanHexInt:&rgb];
    
    CGFloat red, green, blue;
    
    if (trimString.length == 8) {
        CGFloat newAlpha = (rgb & 0xFF000000) >> 24;
        alpha = newAlpha / 255.f;
    }
    
    red = (rgb & 0xFF0000) >> 16;
    green = (rgb & 0x00FF00) >> 8;
    blue = (rgb & 0x0000FF);
    
    return [UIColor colorWithRed:(red / 255.f) green:(green / 255.f) blue:(blue / 255.f) alpha:alpha];
}

+ (UIColor*)db_colorWithHex:(NSInteger)hexValue{
    return [UIColor db_colorWithHex:hexValue alpha:1.0];
}

+ (UIColor*)db_colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0 alpha:alphaValue];
}

@end

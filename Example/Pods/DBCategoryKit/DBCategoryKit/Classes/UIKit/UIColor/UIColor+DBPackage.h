//
//  UIColor+DBPackage.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/27.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (DBPackage)

+ (UIColor*)db_colorWithRed:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue;

+ (UIColor*)db_colorWithRed:(NSUInteger)red green:(NSUInteger)green blue:(NSUInteger)blue alpha:(CGFloat)alpha;

+ (UIColor *)db_colorWithHexString:(NSString *)string;

+ (UIColor *)db_colorWithHexString:(NSString *)string alpha:(CGFloat)alpha;

+ (UIColor*)db_colorWithHex:(NSInteger)hexValue;

+ (UIColor*)db_colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;

@end

NS_ASSUME_NONNULL_END

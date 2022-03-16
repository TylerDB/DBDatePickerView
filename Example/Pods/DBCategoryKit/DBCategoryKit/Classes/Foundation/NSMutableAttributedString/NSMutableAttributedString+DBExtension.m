//
//  NSMutableAttributedString+DBExtension.m
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/5.
//  Copyright © 2019年 DB. All rights reserved.
//

#import "NSMutableAttributedString+DBExtension.h"

@implementation NSMutableAttributedString (DBExtension)

+ (instancetype)db_mutableAttributedString:(NSString *)string{
    return [[NSMutableAttributedString alloc] initWithString:string];
}

- (void)db_addAttributeFont:(UIFont *)font range:(NSRange)range{
    if (range.length != NSNotFound) {
        [self addAttribute:NSFontAttributeName value:font range:range];
    }else{
        [self rangeError];
    }
}

- (void)db_addAttributeColor:(UIColor *)color range:(NSRange)range{
    if (range.length != NSNotFound) {
        [self addAttribute:NSForegroundColorAttributeName value:color range:range];
    }else{
        [self rangeError];
    }
}

- (void)db_addAttributeParagraphStyle:(NSMutableParagraphStyle *)style range:(NSRange)range{
    if (range.length != NSNotFound) {
        [self addAttribute:NSParagraphStyleAttributeName value:style range:range];
    }else{
        [self rangeError];
    }
    
}

- (void)rangeError{
    NSAssert(NO, @"range 错误");
}

@end

//
//  NSMutableParagraphStyle+DBExtension.m
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/5.
//  Copyright © 2019年 DB. All rights reserved.
//

#import "NSMutableParagraphStyle+DBExtension.h"

@implementation NSMutableParagraphStyle (DBExtension)

+ (instancetype)db_mutableParagraphStyleLineSpacing:(CGFloat)lineSpacing paragraphSpacing:(CGFloat)paragraphSpacing{
    NSMutableParagraphStyle * style = [[NSMutableParagraphStyle alloc] init];
    if (lineSpacing >= 0) {
        style.lineSpacing = lineSpacing;
    }
    
    if (paragraphSpacing >= 0) {
        style.paragraphSpacing = paragraphSpacing;
    }
    return style;
}

- (void)db_firstLineHeadInden:(CGFloat)firstLineHeadInden{
    self.firstLineHeadIndent = firstLineHeadInden;
}

- (void)db_headIndent:(CGFloat)headIndent{
    self.headIndent = headIndent;
}

- (void)db_alignment:(NSTextAlignment)alignment{
    self.alignment = alignment;
}

@end

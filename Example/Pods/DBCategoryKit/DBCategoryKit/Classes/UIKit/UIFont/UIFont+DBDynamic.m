//
//  UIFont+DBDynamic.m
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/28.
//  Copyright © 2018年 DB. All rights reserved.
//

#import "UIFont+DBDynamic.h"

@implementation UIFont (DBDynamic)

+ (UIFont *)db_preferredFontForTextStyle:(NSString *)style withFontName:(NSString *)fontName{
    return [UIFont db_preferredFontForTextStyle:style withFontName:fontName scale:1.0f];
}

+ (UIFont *)db_preferredFontForTextStyle:(NSString *)style withFontName:(NSString *)fontName scale:(CGFloat)scale{
    
    UIFont * font = nil;
    if([[UIFont class] resolveClassMethod:@selector(preferredFontForTextStyle:)]){
        font = [UIFont preferredFontForTextStyle:fontName];
    }else{
        font = [UIFont fontWithName:fontName size:14 * scale];
    }
    
    return [font db_adjustFontForTextStyle:style];
    
}

- (UIFont *)db_adjustFontForTextStyle:(NSString *)style{
    return [self db_adjustFontForTextStyle:style scale:1.0f];
}

- (UIFont *)db_adjustFontForTextStyle:(NSString *)style scale:(CGFloat)scale{
    
    UIFontDescriptor * fontDescriptor = nil;
    
    if([[UIFont class] resolveClassMethod:@selector(preferredFontForTextStyle:)]){
        
        fontDescriptor = [UIFontDescriptor preferredFontDescriptorWithTextStyle:style];
        
    }else{
        
        fontDescriptor = self.fontDescriptor;
        
    }
    
    float dynamicSize = [fontDescriptor pointSize] * scale + 3;
    
    return [UIFont fontWithName:self.fontName size:dynamicSize];
    
}

@end

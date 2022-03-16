//
//  UIFont+DBDynamic.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/28.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (DBDynamic)

+(UIFont *)db_preferredFontForTextStyle:(NSString *)style withFontName:(NSString *)fontName scale:(CGFloat)scale;

+(UIFont *)db_preferredFontForTextStyle:(NSString *)style withFontName:(NSString *)fontName;

-(UIFont *)db_adjustFontForTextStyle:(NSString *)style;

-(UIFont *)db_adjustFontForTextStyle:(NSString *)style scale:(CGFloat)scale;

@end

NS_ASSUME_NONNULL_END

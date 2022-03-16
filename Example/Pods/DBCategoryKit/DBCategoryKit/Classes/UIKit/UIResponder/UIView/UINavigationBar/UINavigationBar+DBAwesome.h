//
//  UINavigationBar+DBAwesome.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/28.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationBar (DBAwesome)

- (void)db_setBackgroundColor:(UIColor *)backgroundColor;
- (void)db_setElementsAlpha:(CGFloat)alpha;
- (void)db_setTranslationY:(CGFloat)translationY;
- (void)db_reset;

@end

NS_ASSUME_NONNULL_END

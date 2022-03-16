//
//  UIBezierPath+DBSymbol.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/29.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    kUIBezierPathArrowDirectionNone  = 0,
    kUIBezierPathArrowDirectionRight = 1 << 0,
    kUIBezierPathArrowDirectionLeft  = 1 << 1,
    kUIBezierPathArrowDirectionUp    = 1 << 2,
    kUIBezierPathArrowDirectionDown  = 1 << 3
}DBUIBezierPathArrowDirection;

NS_ASSUME_NONNULL_BEGIN

@interface UIBezierPath (DBSymbol)

+ (UIBezierPath *)db_customBezierPathOfPlusSymbolWithRect:(CGRect)rect   // plus
                                                    scale:(CGFloat)scale;
+ (UIBezierPath *)db_customBezierPathOfMinusSymbolWithRect:(CGRect)rect  // minus
                                                     scale:(CGFloat)scale;
+ (UIBezierPath *)db_customBezierPathOfCheckSymbolWithRect:(CGRect)rect  // check
                                                     scale:(CGFloat)scale
                                                     thick:(CGFloat)thick;
+ (UIBezierPath *)db_customBezierPathOfCrossSymbolWithRect:(CGRect)rect  // cross
                                                     scale:(CGFloat)scale
                                                     thick:(CGFloat)thick;
+ (UIBezierPath *)db_customBezierPathOfArrowSymbolWithRect:(CGRect)rect  // arrow
                                                     scale:(CGFloat)scale
                                                     thick:(CGFloat)thick
                                                 direction:(DBUIBezierPathArrowDirection)direction;
+ (UIBezierPath *)db_customBezierPathOfPencilSymbolWithRect:(CGRect)rect // pencil
                                                      scale:(CGFloat)scale
                                                      thick:(CGFloat)thick;

@end

NS_ASSUME_NONNULL_END

//
//  CAMediaTimingFunction+DBAdditionalEquations.h
//  DBCategoryKit
//
//  Created by DB on 2019/1/7.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface CAMediaTimingFunction (DBAdditionalEquations)

///---------------------------------------------------------------------------------------
/// @name Circ Easing
///---------------------------------------------------------------------------------------
+ (CAMediaTimingFunction *)db_easeInCirc;
+ (CAMediaTimingFunction *)db_easeOutCirc;
+ (CAMediaTimingFunction *)db_easeInOutCirc;

///---------------------------------------------------------------------------------------
/// @name Cubic Easing
///---------------------------------------------------------------------------------------
+ (CAMediaTimingFunction *)db_easeInCubic;
+ (CAMediaTimingFunction *)db_easeOutCubic;
+ (CAMediaTimingFunction *)db_easeInOutCubic;

///---------------------------------------------------------------------------------------
/// @name Expo Easing
///---------------------------------------------------------------------------------------
+ (CAMediaTimingFunction *)db_easeInExpo;
+ (CAMediaTimingFunction *)db_easeOutExpo;
+ (CAMediaTimingFunction *)db_easeInOutExpo;

///---------------------------------------------------------------------------------------
/// @name Quad Easing
///---------------------------------------------------------------------------------------
+ (CAMediaTimingFunction *)db_easeInQuad;
+ (CAMediaTimingFunction *)db_easeOutQuad;
+ (CAMediaTimingFunction *)db_easeInOutQuad;

///---------------------------------------------------------------------------------------
/// @name Quart Easing
///---------------------------------------------------------------------------------------
+ (CAMediaTimingFunction *)db_easeInQuart;
+ (CAMediaTimingFunction *)db_easeOutQuart;
+ (CAMediaTimingFunction *)db_easeInOutQuart;

///---------------------------------------------------------------------------------------
/// @name Quint Easing
///---------------------------------------------------------------------------------------
+ (CAMediaTimingFunction *)db_easeInQuint;
+ (CAMediaTimingFunction *)db_easeOutQuint;
+ (CAMediaTimingFunction *)db_easeInOutQuint;

///---------------------------------------------------------------------------------------
/// @name Sine Easing
///---------------------------------------------------------------------------------------
+ (CAMediaTimingFunction *)db_easeInSine;
+ (CAMediaTimingFunction *)db_easeOutSine;
+ (CAMediaTimingFunction *)db_easeInOutSine;

///---------------------------------------------------------------------------------------
/// @name Back Easing
///---------------------------------------------------------------------------------------
+ (CAMediaTimingFunction *)db_easeInBack;
+ (CAMediaTimingFunction *)db_easeOutBack;
+ (CAMediaTimingFunction *)db_easeInOutBack;

@end

NS_ASSUME_NONNULL_END

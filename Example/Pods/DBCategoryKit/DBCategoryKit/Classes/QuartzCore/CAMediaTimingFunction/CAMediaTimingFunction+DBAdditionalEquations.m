//
//  CAMediaTimingFunction+DBAdditionalEquations.m
//  DBCategoryKit
//
//  Created by DB on 2019/1/7.
//

#import "CAMediaTimingFunction+DBAdditionalEquations.h"

@implementation CAMediaTimingFunction (DBAdditionalEquations)

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Circ
+ (CAMediaTimingFunction *)db_easeInCirc
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.6 : 0.04 : 0.98 : 0.335];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (CAMediaTimingFunction *)db_easeOutCirc
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.075 : 0.82 : 0.165 : 1.0];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (CAMediaTimingFunction *)db_easeInOutCirc
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.785 : 0.135 : 0.15 : 0.86];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Cubic
+ (CAMediaTimingFunction *)db_easeInCubic
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.55 : 0.055 : 0.675 : 0.19];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (CAMediaTimingFunction *)db_easeOutCubic
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.215 : 0.61 : 0.355 : 1.0];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (CAMediaTimingFunction *)db_easeInOutCubic
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.645 : 0.045 : 0.355 : 1.0];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Expo
+ (CAMediaTimingFunction *)db_easeInExpo
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.95 : 0.05 : 0.795 : 0.035];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (CAMediaTimingFunction *)db_easeOutExpo
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.19 : 1.0 : 0.22 : 1.0];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (CAMediaTimingFunction *)db_easeInOutExpo
{
    return [CAMediaTimingFunction functionWithControlPoints: 1.0 : 0.0 : 0.0 : 1.0];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Quad
+ (CAMediaTimingFunction *)db_easeInQuad
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.55 : 0.085 : 0.68 : 0.53];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (CAMediaTimingFunction *)db_easeOutQuad
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.25 : 0.46 : 0.45 : 0.94];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (CAMediaTimingFunction *)db_easeInOutQuad
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.455 : 0.03 : 0.515 : 0.955];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Quart
+ (CAMediaTimingFunction *)db_easeInQuart
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.895 : 0.03 : 0.685 : 0.22];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (CAMediaTimingFunction *)db_easeOutQuart
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.165 : 0.84 : 0.44 : 1.0];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (CAMediaTimingFunction *)db_easeInOutQuart
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.77 : 0.0 : 0.175 : 1.0];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Quint
+ (CAMediaTimingFunction *)db_easeInQuint
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.755 : 0.05 : 0.855 : 0.06];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (CAMediaTimingFunction *)db_easeOutQuint
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.23 : 1.0 : 0.320 : 1.0];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (CAMediaTimingFunction *)db_easeInOutQuint
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.86 : 0.0 : 0.07 : 1.0];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Sine
+ (CAMediaTimingFunction *)db_easeInSine
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.47 : 0.0 : 0.745 : 0.715];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (CAMediaTimingFunction *)db_easeOutSine
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.39 : 0.575 : 0.565 : 1.0];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (CAMediaTimingFunction *)db_easeInOutSine
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.445 : 0.05 : 0.55 : 0.95];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Back
+ (CAMediaTimingFunction *)db_easeInBack
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.6 : -0.28 : 0.735 : 0.045];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (CAMediaTimingFunction *)db_easeOutBack
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.175 : 0.885 : 0.320 : 1.275];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (CAMediaTimingFunction *)db_easeInOutBack
{
    return [CAMediaTimingFunction functionWithControlPoints: 0.68 : -0.55 : 0.265 : 1.55];
}

@end

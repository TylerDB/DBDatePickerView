//
//  CAAnimation+DBEasingEquations.h
//  DBCategoryKit
//
//  Created by DB on 2019/1/7.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, CAAnimationEasingFunction) {
    CAAnimationEasingFunctionLinear,
    
    CAAnimationEasingFunctionEaseInQuad,
    CAAnimationEasingFunctionEaseOutQuad,
    CAAnimationEasingFunctionEaseInOutQuad,
    
    CAAnimationEasingFunctionEaseInCubic,
    CAAnimationEasingFunctionEaseOutCubic,
    CAAnimationEasingFunctionEaseInOutCubic,
    
    CAAnimationEasingFunctionEaseInQuartic,
    CAAnimationEasingFunctionEaseOutQuartic,
    CAAnimationEasingFunctionEaseInOutQuartic,
    
    CAAnimationEasingFunctionEaseInQuintic,
    CAAnimationEasingFunctionEaseOutQuintic,
    CAAnimationEasingFunctionEaseInOutQuintic,
    
    CAAnimationEasingFunctionEaseInSine,
    CAAnimationEasingFunctionEaseOutSine,
    CAAnimationEasingFunctionEaseInOutSine,
    
    CAAnimationEasingFunctionEaseInExponential,
    CAAnimationEasingFunctionEaseOutExponential,
    CAAnimationEasingFunctionEaseInOutExponential,
    
    CAAnimationEasingFunctionEaseInCircular,
    CAAnimationEasingFunctionEaseOutCircular,
    CAAnimationEasingFunctionEaseInOutCircular,
    
    CAAnimationEasingFunctionEaseInElastic,
    CAAnimationEasingFunctionEaseOutElastic,
    CAAnimationEasingFunctionEaseInOutElastic,
    
    CAAnimationEasingFunctionEaseInBack,
    CAAnimationEasingFunctionEaseOutBack,
    CAAnimationEasingFunctionEaseInOutBack,
    
    CAAnimationEasingFunctionEaseInBounce,
    CAAnimationEasingFunctionEaseOutBounce,
    CAAnimationEasingFunctionEaseInOutBounce
};

@interface CAAnimation (DBEasingEquations)

+ (CAKeyframeAnimation*)db_transformAnimationWithDuration:(CGFloat)duration
                                                     from:(CATransform3D)startValue
                                                       to:(CATransform3D)endValue
                                           easingFunction:(CAAnimationEasingFunction)easingFunction;

+ (void)db_addAnimationToLayer:(CALayer *)layer
                      duration:(CGFloat)duration
                     transform:(CATransform3D)transform
                easingFunction:(CAAnimationEasingFunction)easingFunction;

+ (CAKeyframeAnimation*)db_animationWithKeyPath:(NSString *)keyPath
                                       duration:(CGFloat)duration
                                           from:(CGFloat)startValue
                                             to:(CGFloat)endValue
                                 easingFunction:(CAAnimationEasingFunction)easingFunction;

+ (void)db_addAnimationToLayer:(CALayer *)layer
                   withKeyPath:(NSString *)keyPath
                      duration:(CGFloat)duration
                            to:(CGFloat)endValue
                easingFunction:(CAAnimationEasingFunction)easingFunction;

+ (void)db_addAnimationToLayer:(CALayer *)layer
                   withKeyPath:(NSString *)keyPath
                      duration:(CGFloat)duration
                          from:(CGFloat)startValue
                            to:(CGFloat)endValue
                easingFunction:(CAAnimationEasingFunction)easingFunction;
@end

NS_ASSUME_NONNULL_END

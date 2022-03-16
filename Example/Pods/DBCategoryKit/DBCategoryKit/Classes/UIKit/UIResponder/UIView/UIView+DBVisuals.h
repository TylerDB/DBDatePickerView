//
//  UIView+DBVisuals.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/27.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface UIView (DBVisuals)

/*
 *  Sets a corners with radius, given stroke size & color
 */
- (void)db_cornerRadius:(CGFloat)radius
             strokeSize:(CGFloat)size
                  color:(UIColor *)color;
/*
 *  Sets a corners
 */
- (void)db_setRoundedCorners:(UIRectCorner)corners
                      radius:(CGFloat)radius;

/*
 *  Draws shadow with properties
 */
- (void)db_shadowWithColor:(UIColor *)color
                    offset:(CGSize)offset
                   opacity:(CGFloat)opacity
                    radius:(CGFloat)radius;

/*
 *  Removes from superview with fade
 */
- (void)db_removeFromSuperviewWithFadeDuration:(NSTimeInterval)duration;

/*
 *  Adds a subview with given transition & duration
 */
- (void)db_addSubview:(UIView *)view
       withTransition:(UIViewAnimationTransition)transition
             duration:(NSTimeInterval)duration;

/*
 *  Removes view from superview with given transition & duration
 */
- (void)db_removeFromSuperviewWithTransition:(UIViewAnimationTransition)transition
                                    duration:(NSTimeInterval)duration;

/*
 *  Rotates view by given angle. TimingFunction can be nil and defaults to kCAMediaTimingFunctionEaseInEaseOut.
 */
- (void)db_rotateByAngle:(CGFloat)angle
                duration:(NSTimeInterval)duration
             autoreverse:(BOOL)autoreverse
             repeatCount:(CGFloat)repeatCount
          timingFunction:(CAMediaTimingFunction *)timingFunction;

/*
 *  Moves view to point. TimingFunction can be nil and defaults to kCAMediaTimingFunctionEaseInEaseOut.
 */
- (void)db_moveToPoint:(CGPoint)newPoint
              duration:(NSTimeInterval)duration
           autoreverse:(BOOL)autoreverse
           repeatCount:(CGFloat)repeatCount
        timingFunction:(CAMediaTimingFunction *)timingFunction;

/*
 *  Create gradient color
 */
- (void)db_createGradientColor:(CGPoint)startPoint
                      endPoint:(CGPoint)endPoint
                        colors:(NSArray *)colors
                     locations:(NSArray<NSNumber *> *)locations;
                    
@end

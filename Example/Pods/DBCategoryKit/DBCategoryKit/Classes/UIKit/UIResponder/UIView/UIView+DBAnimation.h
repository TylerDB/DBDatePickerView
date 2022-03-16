//
//  UIView+DBAnimation.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/27.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>

float db_radiansForDegrees(int degrees);

@interface UIView (DBAnimation)

// Moves
- (void)db_moveTo:(CGPoint)destination duration:(float)secs option:(UIViewAnimationOptions)option;
- (void)db_moveTo:(CGPoint)destination duration:(float)secs option:(UIViewAnimationOptions)option delegate:(id)delegate callback:(SEL)method;
- (void)db_raceTo:(CGPoint)destination withSnapBack:(BOOL)withSnapBack;
- (void)db_raceTo:(CGPoint)destination withSnapBack:(BOOL)withSnapBack delegate:(id)delegate callback:(SEL)method;

// Transforms
- (void)db_rotate:(int)degrees secs:(float)secs delegate:(id)delegate callback:(SEL)method;
- (void)db_scale:(float)secs x:(float)scaleX y:(float)scaleY delegate:(id)delegate callback:(SEL)method;
- (void)db_spinClockwise:(float)secs;//顺时针旋转
- (void)db_spinCounterClockwise:(float)secs;//逆时针旋转

// Transitions
- (void)db_curlDown:(float)secs;// 从上向下卷（效果类似于反着翻书）
- (void)db_curlUpAndAway:(float)secs;// 从下向上卷(效果类似正着翻书)
- (void)db_drainAway:(float)secs;

// Effects
- (void)db_changeAlpha:(float)newAlpha secs:(float)secs;
- (void)db_pulse:(float)secs continuously:(BOOL)continuously;

//add subview
- (void)db_addSubviewWithFadeAnimation:(UIView *)subview;

@end

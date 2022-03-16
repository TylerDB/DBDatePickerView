//
//  UIView+DBShake.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/27.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, DBShakeDirection) {
    DBShakeDirectionHorizontal = 0,
    DBShakeDirectionVertical
};

@interface UIView (DBShake)

/** Shake the UIView
 *
 * Shake the view a default number of times
 */
- (void)db_shake;

/** Shake the UIView
 *
 * Shake the view a given number of times
 *
 * @param times The number of shakes
 * @param delta The width of the shake
 */
- (void)db_shake:(int)times withDelta:(CGFloat)delta;

/** Shake the UIView
 *
 * Shake the view a given number of times
 *
 * @param times The number of shakes
 * @param delta The width of the shake
 * @param handler A block object to be executed when the shake sequence ends
 */
- (void)db_shake:(int)times withDelta:(CGFloat)delta completion:(void((^)(void)))handler;

/** Shake the UIView at a custom speed
 *
 * Shake the view a given number of times with a given speed
 *
 * @param times The number of shakes
 * @param delta The width of the shake
 * @param interval The duration of one shake
 */
- (void)db_shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval;

/** Shake the UIView at a custom speed
 *
 * Shake the view a given number of times with a given speed
 *
 * @param times The number of shakes
 * @param delta The width of the shake
 * @param interval The duration of one shake
 * @param handler A block object to be executed when the shake sequence ends
 */
- (void)db_shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval completion:(void((^)(void)))handler;

/** Shake the UIView at a custom speed
 *
 * Shake the view a given number of times with a given speed
 *
 * @param times The number of shakes
 * @param delta The width of the shake
 * @param interval The duration of one shake
 * @param shakeDirection    direction of the shake
 */
- (void)db_shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval shakeDirection:(DBShakeDirection)shakeDirection;

/** Shake the UIView at a custom speed
 *
 * Shake the view a given number of times with a given speed, with a completion handler
 *
 * @param times The number of shakes
 * @param delta The width of the shake
 * @param interval The duration of one shake
 * @param shakeDirection    direction of the shake
 * @param completion to be called when the view is done shaking
 */
- (void)db_shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval shakeDirection:(DBShakeDirection)shakeDirection completion:(void(^)(void))completion;

@end

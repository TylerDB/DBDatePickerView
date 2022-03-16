//
//  UIView+DBShake.m
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/27.
//  Copyright © 2018年 DB. All rights reserved.
//

#import "UIView+DBShake.h"

@implementation UIView (DBShake)

- (void)db_shake {
    [self _db_shake:10 direction:1 currentTimes:0 withDelta:5 speed:0.03 shakeDirection:DBShakeDirectionHorizontal completion:nil];
}

- (void)db_shake:(int)times withDelta:(CGFloat)delta {
    [self _db_shake:times direction:1 currentTimes:0 withDelta:delta speed:0.03 shakeDirection:DBShakeDirectionHorizontal completion:nil];
}

- (void)db_shake:(int)times withDelta:(CGFloat)delta completion:(void(^)(void))handler {
    [self _db_shake:times direction:1 currentTimes:0 withDelta:delta speed:0.03 shakeDirection:DBShakeDirectionHorizontal completion:handler];
}

- (void)db_shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval {
    [self _db_shake:times direction:1 currentTimes:0 withDelta:delta speed:interval shakeDirection:DBShakeDirectionHorizontal completion:nil];
}

- (void)db_shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval completion:(void(^)(void))handler {
    [self _db_shake:times direction:1 currentTimes:0 withDelta:delta speed:interval shakeDirection:DBShakeDirectionHorizontal completion:handler];
}

- (void)db_shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval shakeDirection:(DBShakeDirection)shakeDirection {
    [self _db_shake:times direction:1 currentTimes:0 withDelta:delta speed:interval shakeDirection:shakeDirection completion:nil];
}

- (void)db_shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval shakeDirection:(DBShakeDirection)shakeDirection completion:(void (^)(void))completion {
    [self _db_shake:times direction:1 currentTimes:0 withDelta:delta speed:interval shakeDirection:shakeDirection completion:completion];
}

- (void)_db_shake:(int)times direction:(int)direction currentTimes:(int)current withDelta:(CGFloat)delta speed:(NSTimeInterval)interval shakeDirection:(DBShakeDirection)shakeDirection completion:(void (^)(void))completionHandler {
    [UIView animateWithDuration:interval animations:^{
        self.layer.affineTransform = (shakeDirection == DBShakeDirectionHorizontal) ? CGAffineTransformMakeTranslation(delta * direction, 0) : CGAffineTransformMakeTranslation(0, delta * direction);
    } completion:^(BOOL finished) {
        if(current >= times) {
            [UIView animateWithDuration:interval animations:^{
                self.layer.affineTransform = CGAffineTransformIdentity;
            } completion:^(BOOL finished){
                if (completionHandler != nil) {
                    completionHandler();
                }
            }];
            return;
        }
        [self _db_shake:(times - 1)
              direction:direction * -1
           currentTimes:current + 1
              withDelta:delta
                  speed:interval
         shakeDirection:shakeDirection
             completion:completionHandler];
    }];
}

@end

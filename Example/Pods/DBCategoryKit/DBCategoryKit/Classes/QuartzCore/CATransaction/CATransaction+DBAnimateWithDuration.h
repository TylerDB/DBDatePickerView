//
//  CATransaction+DBAnimateWithDuration.h
//  DBCategoryKit
//
//  Created by DB on 2019/1/7.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface CATransaction (DBAnimateWithDuration)

/**
 *
 *  @brief  CATransaction 动画执 block回调
 *
 *  @param duration   动画时间
 *  @param animations 动画块
 *  @param completion 动画结束回调
 */
+ (void)db_animateWithDuration:(NSTimeInterval)duration
                    animations:(nullable void (^)(void))animations
                    completion:(nullable void (^)(void))completion;

@end

NS_ASSUME_NONNULL_END

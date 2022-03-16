//
//  CATransaction+DBAnimateWithDuration.m
//  DBCategoryKit
//
//  Created by DB on 2019/1/7.
//

#import "CATransaction+DBAnimateWithDuration.h"

@implementation CATransaction (DBAnimateWithDuration)

+ (void)db_animateWithDuration:(NSTimeInterval)duration
                    animations:(void (^)(void))animations
                    completion:(void (^)(void))completion
{
    [CATransaction begin];
    [CATransaction setAnimationDuration:duration];
    
    if (completion)
    {
        [CATransaction setCompletionBlock:completion];
    }
    
    if (animations)
    {
        animations();
    }
    [CATransaction commit];
}

@end

//
//  UIView+DBScreenShot.m
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/26.
//  Copyright © 2018年 DB. All rights reserved.
//

#import "UIView+DBScreenShot.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (DBScreenShot)

- (UIImage *)db_screenshot{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [UIScreen mainScreen].scale);
    if( [self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)])
    {
        [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:NO];
    }
    else
    {
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    }
    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return screenshot;
}

- (UIImage *)db_screenshot:(CGFloat)maxWidth{
    CGAffineTransform oldTransform = self.transform;
    CGAffineTransform scaleTransform = CGAffineTransformIdentity;
    if (!isnan(maxWidth) && maxWidth>0) {
        CGFloat maxScale = maxWidth/CGRectGetWidth(self.frame);
        CGAffineTransform transformScale = CGAffineTransformMakeScale(maxScale, maxScale);
        scaleTransform = CGAffineTransformConcat(oldTransform, transformScale);
        
    }
    if(!CGAffineTransformEqualToTransform(scaleTransform, CGAffineTransformIdentity)){
        self.transform = scaleTransform;
    }
    CGRect actureFrame = self.frame; //已经变换过后的frame
    CGRect actureBounds= self.bounds;//CGRectApplyAffineTransform();
    
    //begin
    UIGraphicsBeginImageContextWithOptions(actureFrame.size, NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    //CGContextScaleCTM(UIGraphicsGetCurrentContext(), 1, -1);
    CGContextTranslateCTM(context,actureFrame.size.width/2, actureFrame.size.height/2);
    CGContextConcatCTM(context, self.transform);
    CGPoint anchorPoint = self.layer.anchorPoint;
    CGContextTranslateCTM(context,
                          -actureBounds.size.width * anchorPoint.x,
                          -actureBounds.size.height * anchorPoint.y);
    if([self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)])
    {
        [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:NO];
    }
    else
    {
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    }
    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    //end
    self.transform = oldTransform;
    
    return screenshot;
}

@end

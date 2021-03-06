//
//  UIImage+DBBetterFace.m
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/27.
//  Copyright © 2018年 DB. All rights reserved.
//

#import "UIImage+DBBetterFace.h"

#define GOLDEN_RATIO (0.618)

@implementation UIImage (DBBetterFace)

- (UIImage *)db_betterFaceImageForSize:(CGSize)size
                              accuracy:(DBAccuracy)accurary;
{
    NSArray *features = [UIImage _db_faceFeaturesInImage:self accuracy:accurary];
    
    if ([features count]==0) {
        NSLog(@"no faces");
        return nil;
    } else {
        NSLog(@"succeed %lu faces", (unsigned long)[features count]);
        return [self _db_subImageForFaceFeatures:features
                                            size:size];
    }
}

- (UIImage *)_db_subImageForFaceFeatures:(NSArray *)faceFeatures size:(CGSize)size
{
    CGRect fixedRect = CGRectMake(MAXFLOAT, MAXFLOAT, 0, 0);
    CGFloat rightBorder = 0, bottomBorder = 0;
    for (CIFaceFeature *faceFeature in faceFeatures){
        CGRect oneRect = faceFeature.bounds;
        oneRect.origin.y = size.height - oneRect.origin.y - oneRect.size.height;
        
        fixedRect.origin.x = MIN(oneRect.origin.x, fixedRect.origin.x);
        fixedRect.origin.y = MIN(oneRect.origin.y, fixedRect.origin.y);
        
        rightBorder = MAX(oneRect.origin.x + oneRect.size.width, rightBorder);
        bottomBorder = MAX(oneRect.origin.y + oneRect.size.height, bottomBorder);
    }
    
    fixedRect.size.width = rightBorder - fixedRect.origin.x;
    fixedRect.size.height = bottomBorder - fixedRect.origin.y;
    
    CGPoint fixedCenter = CGPointMake(fixedRect.origin.x + fixedRect.size.width / 2.0,
                                      fixedRect.origin.y + fixedRect.size.height / 2.0);
    CGPoint offset = CGPointZero;
    CGSize finalSize = size;
    if (size.width / size.height > self.size.width / self.size.height) {
        //move horizonal
        finalSize.height = self.size.height;
        finalSize.width = size.width/size.height * finalSize.height;
        fixedCenter.x = finalSize.width / size.width * fixedCenter.x;
        fixedCenter.y = finalSize.width / size.width * fixedCenter.y;
        
        offset.x = fixedCenter.x - self.size.width * 0.5;
        if (offset.x < 0) {
            offset.x = 0;
        } else if (offset.x + self.size.width > finalSize.width) {
            offset.x = finalSize.width - self.size.width;
        }
        offset.x = - offset.x;
    } else {
        //move vertical
        finalSize.width = self.size.width;
        finalSize.height = size.height/size.width * finalSize.width;
        fixedCenter.x = finalSize.width / size.width * fixedCenter.x;
        fixedCenter.y = finalSize.width / size.width * fixedCenter.y;
        
        offset.y = fixedCenter.y - self.size.height * (1-GOLDEN_RATIO);
        if (offset.y < 0) {
            offset.y = 0;
        } else if (offset.y + self.size.height > finalSize.height){
            offset.y = finalSize.height = self.size.height;
        }
        offset.y = - offset.y;
    }
    
    CGRect finalRect = CGRectApplyAffineTransform(CGRectMake(offset.x, offset.y, finalSize.width, finalSize.height),
                                                  CGAffineTransformMakeScale(self.scale, self.scale));
    CGImageRef imageRef = CGImageCreateWithImageInRect([self CGImage], finalRect);
    UIImage *subImage = [UIImage imageWithCGImage:imageRef scale:self.scale orientation:self.imageOrientation];
    CGImageRelease(imageRef);
    
    return subImage;
}

#pragma mark - Util
+ (NSArray *)_db_faceFeaturesInImage:(UIImage *)image accuracy:(DBAccuracy)accurary
{
    CIImage *ciImage = [CIImage imageWithCGImage:image.CGImage];
    NSString *accuraryStr = (accurary == DBAccuracyLow) ? CIDetectorAccuracyLow : CIDetectorAccuracyHigh;
    
    CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeFace
                                              context:nil
                                              options:@{CIDetectorAccuracy: accuraryStr}];
    
    return [detector featuresInImage:ciImage];
}

@end

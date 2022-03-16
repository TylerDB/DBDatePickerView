//
//  UIImage+DBBetterFace.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/27.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, DBAccuracy) {
    DBAccuracyLow = 0,
    DBAccuracyHigh,
};

@interface UIImage (DBBetterFace)

- (UIImage *)db_betterFaceImageForSize:(CGSize)size
                              accuracy:(DBAccuracy)accurary;

@end

NS_ASSUME_NONNULL_END

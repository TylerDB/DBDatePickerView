//
//  UIScreen+DBFrame.h
//  DBCategoryKit
//
//  Created by DB on 2020/3/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIScreen (DBFrame)

+ (CGSize)db_size;
+ (CGFloat)db_width;
+ (CGFloat)db_height;

+ (CGSize)db_orientationSize;
+ (CGFloat)db_orientationWidth;
+ (CGFloat)db_orientationHeight;
+ (CGSize)db_DPISize;

@end

NS_ASSUME_NONNULL_END

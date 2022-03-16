//
//  UIImageView+DBGeometryConversion.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/27.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//几何转换
@interface UIImageView (DBGeometryConversion)

- (CGPoint)db_convertPointFromImage:(CGPoint)imagePoint;
- (CGRect)db_convertRectFromImage:(CGRect)imageRect;

- (CGPoint)db_convertPointFromView:(CGPoint)viewPoint;
- (CGRect)db_convertRectFromView:(CGRect)viewRect;

@end

NS_ASSUME_NONNULL_END

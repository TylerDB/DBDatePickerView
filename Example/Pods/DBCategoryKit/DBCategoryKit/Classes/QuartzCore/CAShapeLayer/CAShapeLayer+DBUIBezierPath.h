//
//  CAShapeLayer+DBUIBezierPath.h
//  DBCategoryKit
//
//  Created by DB on 2019/1/7.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface CAShapeLayer (DBUIBezierPath)

/**
 Update CAShapeLayer with UIBezierPath.
 */
- (void)db_updateWithBezierPath:(UIBezierPath *)path;

/**
 Get UIBezierPath object, constructed from CAShapeLayer.
 */
- (UIBezierPath *)db_bezierPath;

@end

NS_ASSUME_NONNULL_END

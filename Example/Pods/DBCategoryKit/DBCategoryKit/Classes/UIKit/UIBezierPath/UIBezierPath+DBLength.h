//
//  UIBezierPath+DBLength.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/28.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBezierPath (DBLength)

- (CGFloat)db_length;

- (CGPoint)db_pointAtPercentOfLength:(CGFloat)percent;

@end

NS_ASSUME_NONNULL_END

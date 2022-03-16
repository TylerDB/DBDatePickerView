//
//  UIView+DBConstraints.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/26.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (DBConstraints)

- (NSLayoutConstraint *)db_constraintForAttribute:(NSLayoutAttribute)attribute;

- (NSLayoutConstraint *)db_leftConstraint;
- (NSLayoutConstraint *)db_rightConstraint;
- (NSLayoutConstraint *)db_topConstraint;
- (NSLayoutConstraint *)db_bottomConstraint;
- (NSLayoutConstraint *)db_leadingConstraint;
- (NSLayoutConstraint *)db_trailingConstraint;
- (NSLayoutConstraint *)db_widthConstraint;
- (NSLayoutConstraint *)db_heightConstraint;
- (NSLayoutConstraint *)db_centerXConstraint;
- (NSLayoutConstraint *)db_centerYConstraint;
- (NSLayoutConstraint *)db_baseLineConstraint;

@end

NS_ASSUME_NONNULL_END

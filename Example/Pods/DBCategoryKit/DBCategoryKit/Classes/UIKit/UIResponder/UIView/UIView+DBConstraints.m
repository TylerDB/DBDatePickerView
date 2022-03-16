//
//  UIView+DBConstraints.m
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/26.
//  Copyright © 2018年 DB. All rights reserved.
//

#import "UIView+DBConstraints.h"

@implementation UIView (DBConstraints)

-(NSLayoutConstraint *)db_constraintForAttribute:(NSLayoutAttribute)attribute {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"firstAttribute = %d && (firstItem = %@ || secondItem = %@)", attribute, self, self];
    NSArray *constraintArray = [self.superview constraints];
    
    if (attribute == NSLayoutAttributeWidth || attribute == NSLayoutAttributeHeight) {
        constraintArray = [self constraints];
    }
    
    NSArray *fillteredArray = [constraintArray filteredArrayUsingPredicate:predicate];
    if(fillteredArray.count == 0) {
        return nil;
    } else {
        return fillteredArray.firstObject;
    }
}

- (NSLayoutConstraint *)db_leftConstraint {
    return [self db_constraintForAttribute:NSLayoutAttributeLeft];
}

- (NSLayoutConstraint *)db_rightConstraint {
    return [self db_constraintForAttribute:NSLayoutAttributeRight];
}

- (NSLayoutConstraint *)db_topConstraint {
    return [self db_constraintForAttribute:NSLayoutAttributeTop];
}

- (NSLayoutConstraint *)db_bottomConstraint {
    return [self db_constraintForAttribute:NSLayoutAttributeBottom];
}

- (NSLayoutConstraint *)db_leadingConstraint {
    return [self db_constraintForAttribute:NSLayoutAttributeLeading];
}

- (NSLayoutConstraint *)db_trailingConstraint {
    return [self db_constraintForAttribute:NSLayoutAttributeTrailing];
}

- (NSLayoutConstraint *)db_widthConstraint {
    return [self db_constraintForAttribute:NSLayoutAttributeWidth];
}

- (NSLayoutConstraint *)db_heightConstraint {
    return [self db_constraintForAttribute:NSLayoutAttributeHeight];
}

- (NSLayoutConstraint *)db_centerXConstraint {
    return [self db_constraintForAttribute:NSLayoutAttributeCenterX];
}

- (NSLayoutConstraint *)db_centerYConstraint {
    return [self db_constraintForAttribute:NSLayoutAttributeCenterY];
}

- (NSLayoutConstraint *)db_baseLineConstraint {
    return [self db_constraintForAttribute:NSLayoutAttributeBaseline];
}

@end

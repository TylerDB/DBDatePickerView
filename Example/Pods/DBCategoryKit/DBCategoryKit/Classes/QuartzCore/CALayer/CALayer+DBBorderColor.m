//
//  CALayer+DBBorderColor.m
//  DBCategoryKit
//
//  Created by DB on 2019/1/7.
//

#import "CALayer+DBBorderColor.h"

@implementation CALayer (DBBorderColor)

- (void)setDb_borderColor:(UIColor *)db_borderColor{
    self.borderColor = db_borderColor.CGColor;
}

- (UIColor*)db_borderColor {
    return [UIColor colorWithCGColor:self.borderColor];
}

@end

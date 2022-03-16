//
//  UIBarButtonItem+DBBadge.m
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/28.
//  Copyright © 2018年 DB. All rights reserved.
//

#import "UIBarButtonItem+DBBadge.h"
#import <objc/runtime.h>

NSString const *db_UIBarButtonItem_badgeKey = @"db_UIBarButtonItem_badgeKey";
NSString const *db_UIBarButtonItem_badgeBGColorKey = @"db_UIBarButtonItem_badgeBGColorKey";
NSString const *db_UIBarButtonItem_badgeTextColorKey = @"db_UIBarButtonItem_badgeTextColorKey";
NSString const *db_UIBarButtonItem_badgeFontKey = @"db_UIBarButtonItem_badgeFontKey";
NSString const *db_UIBarButtonItem_badgePaddingKey = @"db_UIBarButtonItem_badgePaddingKey";
NSString const *db_UIBarButtonItem_badgeMinSizeKey = @"db_UIBarButtonItem_badgeMinSizeKey";
NSString const *db_UIBarButtonItem_badgeOriginXKey = @"db_UIBarButtonItem_badgeOriginXKey";
NSString const *db_UIBarButtonItem_badgeOriginYKey = @"db_UIBarButtonItem_badgeOriginYKey";
NSString const *db_UIBarButtonItem_shouldHideBadgeAtZeroKey = @"db_UIBarButtonItem_shouldHideBadgeAtZeroKey";
NSString const *db_UIBarButtonItem_shouldAnimateBadgeKey = @"db_UIBarButtonItem_shouldAnimateBadgeKey";
NSString const *db_UIBarButtonItem_badgeValueKey = @"db_UIBarButtonItem_badgeValueKey";

@implementation UIBarButtonItem (DBBadge)

@dynamic db_badgeValue, db_badgeBGColor, db_badgeTextColor, db_badgeFont;
@dynamic db_badgePadding, db_badgeMinSize, db_badgeOriginX, db_badgeOriginY;
@dynamic db_shouldHideBadgeAtZero, db_shouldAnimateBadge;

- (void)db_badgeInit
{
    UIView *superview = nil;
    CGFloat defaultOriginX = 0;
    if (self.customView) {
        superview = self.customView;
        defaultOriginX = superview.frame.size.width - self.db_badge.frame.size.width/2;
        // Avoids badge to be clipped when animating its scale
        superview.clipsToBounds = NO;
    } else if ([self respondsToSelector:@selector(view)] && [(id)self view]) {
        superview = [(id)self view];
        defaultOriginX = superview.frame.size.width - self.db_badge.frame.size.width;
    }
    [superview addSubview:self.db_badge];
    
    // Default design initialization
    self.db_badgeBGColor   = [UIColor redColor];
    self.db_badgeTextColor = [UIColor whiteColor];
    self.db_badgeFont      = [UIFont systemFontOfSize:12.0];
    self.db_badgePadding   = 6;
    self.db_badgeMinSize   = 8;
    self.db_badgeOriginX   = defaultOriginX;
    self.db_badgeOriginY   = -4;
    self.db_shouldHideBadgeAtZero = YES;
    self.db_shouldAnimateBadge = YES;
}

#pragma mark - Utility methods
// Handle badge display when its properties have been changed (color, font, ...)
- (void)db_refreshBadge
{
    // Change new attributes
    self.db_badge.textColor        = self.db_badgeTextColor;
    self.db_badge.backgroundColor  = self.db_badgeBGColor;
    self.db_badge.font             = self.db_badgeFont;
    
    if (!self.db_badgeValue || [self.db_badgeValue isEqualToString:@""] || ([self.db_badgeValue isEqualToString:@"0"] && self.db_shouldHideBadgeAtZero)) {
        self.db_badge.hidden = YES;
    } else {
        self.db_badge.hidden = NO;
        [self db_updateBadgeValueAnimated:YES];
    }
    
}

- (CGSize)db_badgeExpectedSize
{
    // When the value changes the badge could need to get bigger
    // Calculate expected size to fit new value
    // Use an intermediate label to get expected size thanks to sizeToFit
    // We don't call sizeToFit on the true label to avoid bad display
    UILabel *frameLabel = [self db_duplicateLabel:self.db_badge];
    [frameLabel sizeToFit];
    
    CGSize expectedLabelSize = frameLabel.frame.size;
    return expectedLabelSize;
}

- (void)db_updateBadgeFrame
{
    
    CGSize expectedLabelSize = [self db_badgeExpectedSize];
    
    // Make sure that for small value, the badge will be big enough
    CGFloat minHeight = expectedLabelSize.height;
    
    // Using a const we make sure the badge respect the minimum size
    minHeight = (minHeight < self.db_badgeMinSize) ? self.db_badgeMinSize : expectedLabelSize.height;
    CGFloat minWidth = expectedLabelSize.width;
    CGFloat padding = self.db_badgePadding;
    
    // Using const we make sure the badge doesn't get too smal
    minWidth = (minWidth < minHeight) ? minHeight : expectedLabelSize.width;
    self.db_badge.layer.masksToBounds = YES;
    self.db_badge.frame = CGRectMake(self.db_badgeOriginX, self.db_badgeOriginY, minWidth + padding, minHeight + padding);
    self.db_badge.layer.cornerRadius = (minHeight + padding) / 2;
}

// Handle the badge changing value
- (void)db_updateBadgeValueAnimated:(BOOL)animated
{
    // Bounce animation on badge if value changed and if animation authorized
    if (animated && self.db_shouldAnimateBadge && ![self.db_badge.text isEqualToString:self.db_badgeValue]) {
        CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        [animation setFromValue:[NSNumber numberWithFloat:1.5]];
        [animation setToValue:[NSNumber numberWithFloat:1]];
        [animation setDuration:0.2];
        [animation setTimingFunction:[CAMediaTimingFunction functionWithControlPoints:.4f :1.3f :1.f :1.f]];
        [self.db_badge.layer addAnimation:animation forKey:@"bounceAnimation"];
    }
    
    // Set the new value
    self.db_badge.text = self.db_badgeValue;
    
    // Animate the size modification if needed
    if (animated && self.db_shouldAnimateBadge) {
        [UIView animateWithDuration:0.2 animations:^{
            [self db_updateBadgeFrame];
        }];
    } else {
        [self db_updateBadgeFrame];
    }
}

- (UILabel *)db_duplicateLabel:(UILabel *)labelToCopy
{
    UILabel *duplicateLabel = [[UILabel alloc] initWithFrame:labelToCopy.frame];
    duplicateLabel.text = labelToCopy.text;
    duplicateLabel.font = labelToCopy.font;
    
    return duplicateLabel;
}

- (void)db_removeBadge
{
    // Animate badge removal
    [UIView animateWithDuration:0.2 animations:^{
        self.db_badge.transform = CGAffineTransformMakeScale(0, 0);
    } completion:^(BOOL finished) {
        [self.db_badge removeFromSuperview];
        self.db_badge = nil;
    }];
}

#pragma mark - getters/setters
- (UILabel*)db_badge {
    UILabel* lbl = objc_getAssociatedObject(self, &db_UIBarButtonItem_badgeKey);
    if(lbl==nil) {
        lbl = [[UILabel alloc] initWithFrame:CGRectMake(self.db_badgeOriginX, self.db_badgeOriginY, 20, 20)];
        [self setDb_badge:lbl];
        [self db_badgeInit];
        [self.customView addSubview:lbl];
        lbl.textAlignment = NSTextAlignmentCenter;
    }
    return lbl;
}

- (void)setDb_badge:(UILabel *)badgeLabel
{
    objc_setAssociatedObject(self, &db_UIBarButtonItem_badgeKey, badgeLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

// Badge value to be display
- (NSString *)db_badgeValue {
    return objc_getAssociatedObject(self, &db_UIBarButtonItem_badgeValueKey);
}

- (void)setDb_vadgeValue:(NSString *)badgeValue
{
    objc_setAssociatedObject(self, &db_UIBarButtonItem_badgeValueKey, badgeValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    // When changing the badge value check if we need to remove the badge
    [self db_updateBadgeValueAnimated:YES];
    [self db_refreshBadge];
}

// Badge background color
- (UIColor *)badgeBGColor {
    return objc_getAssociatedObject(self, &db_UIBarButtonItem_badgeBGColorKey);
}

- (void)setBadgeBGColor:(UIColor *)badgeBGColor
{
    objc_setAssociatedObject(self, &db_UIBarButtonItem_badgeBGColorKey, badgeBGColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.db_badge) {
        [self db_refreshBadge];
    }
}

// Badge text color
- (UIColor *)badgeTextColor {
    return objc_getAssociatedObject(self, &db_UIBarButtonItem_badgeTextColorKey);
}

- (void)setBadgeTextColor:(UIColor *)badgeTextColor
{
    objc_setAssociatedObject(self, &db_UIBarButtonItem_badgeTextColorKey, badgeTextColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.db_badge) {
        [self db_refreshBadge];
    }
}

// Badge font
- (UIFont *)badgeFont {
    return objc_getAssociatedObject(self, &db_UIBarButtonItem_badgeFontKey);
}

- (void)setBadgeFont:(UIFont *)badgeFont
{
    objc_setAssociatedObject(self, &db_UIBarButtonItem_badgeFontKey, badgeFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.db_badge) {
        [self db_refreshBadge];
    }
}

// Padding value for the badge
- (CGFloat)badgePadding {
    NSNumber *number = objc_getAssociatedObject(self, &db_UIBarButtonItem_badgePaddingKey);
    return number.floatValue;
}

- (void)setBadgePadding:(CGFloat)badgePadding
{
    NSNumber *number = [NSNumber numberWithDouble:badgePadding];
    objc_setAssociatedObject(self, &db_UIBarButtonItem_badgePaddingKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.db_badge) {
        [self db_updateBadgeFrame];
    }
}

// Minimum size badge to small
- (CGFloat)db_badgeMinSize {
    NSNumber *number = objc_getAssociatedObject(self, &db_UIBarButtonItem_badgeMinSizeKey);
    return number.floatValue;
}

- (void)setDb_badgeMinSize:(CGFloat)badgeMinSize
{
    NSNumber *number = [NSNumber numberWithDouble:badgeMinSize];
    objc_setAssociatedObject(self, &db_UIBarButtonItem_badgeMinSizeKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.db_badge) {
        [self db_updateBadgeFrame];
    }
}

// Values for offseting the badge over the BarButtonItem you picked
- (CGFloat)db_badgeOriginX {
    NSNumber *number = objc_getAssociatedObject(self, &db_UIBarButtonItem_badgeOriginXKey);
    return number.floatValue;
}

- (void)setDb_badgeOriginX:(CGFloat)badgeOriginX
{
    NSNumber *number = [NSNumber numberWithDouble:badgeOriginX];
    objc_setAssociatedObject(self, &db_UIBarButtonItem_badgeOriginXKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.db_badge) {
        [self db_updateBadgeFrame];
    }
}

- (CGFloat)db_badgeOriginY {
    NSNumber *number = objc_getAssociatedObject(self, &db_UIBarButtonItem_badgeOriginYKey);
    return number.floatValue;
}

- (void)setDb_badgeOriginY:(CGFloat)badgeOriginY
{
    NSNumber *number = [NSNumber numberWithDouble:badgeOriginY];
    objc_setAssociatedObject(self, &db_UIBarButtonItem_badgeOriginYKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.db_badge) {
        [self db_updateBadgeFrame];
    }
}

// In case of numbers, remove the badge when reaching zero
- (BOOL)shouldHideBadgeAtZero {
    NSNumber *number = objc_getAssociatedObject(self, &db_UIBarButtonItem_shouldHideBadgeAtZeroKey);
    return number.boolValue;
}

- (void)setShouldHideBadgeAtZero:(BOOL)shouldHideBadgeAtZero
{
    NSNumber *number = [NSNumber numberWithBool:shouldHideBadgeAtZero];
    objc_setAssociatedObject(self, &db_UIBarButtonItem_shouldHideBadgeAtZeroKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if(self.db_badge) {
        [self db_refreshBadge];
    }
}

// Badge has a bounce animation when value changes
- (BOOL)db_shouldAnimateBadge {
    NSNumber *number = objc_getAssociatedObject(self, &db_UIBarButtonItem_shouldAnimateBadgeKey);
    return number.boolValue;
}

- (void)setDb_shouldAnimateBadge:(BOOL)shouldAnimateBadge
{
    NSNumber *number = [NSNumber numberWithBool:shouldAnimateBadge];
    objc_setAssociatedObject(self, &db_UIBarButtonItem_shouldAnimateBadgeKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if(self.db_badge) {
        [self db_refreshBadge];
    }
}

@end

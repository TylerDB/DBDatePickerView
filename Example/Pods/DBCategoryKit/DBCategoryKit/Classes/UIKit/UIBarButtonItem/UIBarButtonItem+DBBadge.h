//
//  UIBarButtonItem+DBBadge.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/28.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (DBBadge)

@property (strong, atomic) UILabel *db_badge;

// Badge value to be display
@property (nonatomic) NSString *db_badgeValue;
// Badge background color
@property (nonatomic) UIColor *db_badgeBGColor;
// Badge text color
@property (nonatomic) UIColor *db_badgeTextColor;
// Badge font
@property (nonatomic) UIFont *db_badgeFont;
// Padding value for the badge
@property (nonatomic) CGFloat db_badgePadding;
// Minimum size badge to small
@property (nonatomic) CGFloat db_badgeMinSize;
// Values for offseting the badge over the BarButtonItem you picked
@property (nonatomic) CGFloat db_badgeOriginX;
@property (nonatomic) CGFloat db_badgeOriginY;
// In case of numbers, remove the badge when reaching zero
@property BOOL db_shouldHideBadgeAtZero;
// Badge has a bounce animation when value changes
@property BOOL db_shouldAnimateBadge;

@end

NS_ASSUME_NONNULL_END

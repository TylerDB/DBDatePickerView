//
//  UIView+DBFrame.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/26.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (DBFrame)

@property (nonatomic, assign) CGPoint db_origin;
@property (nonatomic, assign) CGSize db_size;

@property (nonatomic) CGFloat db_centerX;
@property (nonatomic) CGFloat db_centerY;

@property (nonatomic) CGFloat db_top;
@property (nonatomic) CGFloat db_bottom;
@property (nonatomic) CGFloat db_right;
@property (nonatomic) CGFloat db_left;

@property (nonatomic) CGFloat db_width;
@property (nonatomic) CGFloat db_height;

@end

NS_ASSUME_NONNULL_END

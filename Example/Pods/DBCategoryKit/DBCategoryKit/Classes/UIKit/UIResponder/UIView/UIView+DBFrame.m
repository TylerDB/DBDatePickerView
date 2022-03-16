//
//  UIView+DBFrame.m
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/26.
//  Copyright © 2018年 DB. All rights reserved.
//

#import "UIView+DBFrame.h"

@implementation UIView (DBFrame)

#pragma mark - Shortcuts for the coords

- (CGFloat)db_top
{
    return self.frame.origin.y;
}

- (void)setDb_top:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)db_right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setDb_right:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = right - self.frame.size.width;
    self.frame = frame;
}

- (CGFloat)db_bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setDb_bottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - self.frame.size.height;
    self.frame = frame;
}

- (CGFloat)db_left
{
    return self.frame.origin.x;
}

- (void)setDb_left:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)db_width
{
    return self.frame.size.width;
}

- (void)setDb_width:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)db_height
{
    return self.frame.size.height;
}

- (void)setDb_height:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

#pragma mark - Shortcuts for frame properties

- (CGPoint)db_origin {
    return self.frame.origin;
}

- (void)setDb_origin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)db_size {
    return self.frame.size;
}

- (void)setDb_size:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

#pragma mark - Shortcuts for positions

- (CGFloat)db_centerX {
    return self.center.x;
}

- (void)setDb_centerX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)db_centerY {
    return self.center.y;
}

- (void)setDb_centerY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

@end

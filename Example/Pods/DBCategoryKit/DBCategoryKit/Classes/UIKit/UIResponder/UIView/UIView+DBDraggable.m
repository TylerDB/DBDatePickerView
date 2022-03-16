//
//  UIView+DBDraggable.m
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/27.
//  Copyright © 2018年 DB. All rights reserved.
//

#import "UIView+DBDraggable.h"
#import <objc/runtime.h>

@implementation UIView (DBDraggable)

- (void)setDb_panGesture:(UIPanGestureRecognizer*)panGesture
{
    objc_setAssociatedObject(self, @selector(db_panGesture), panGesture, OBJC_ASSOCIATION_RETAIN);
}

- (UIPanGestureRecognizer*)db_panGesture
{
    return objc_getAssociatedObject(self, @selector(db_panGesture));
}

- (void)setDb_cagingArea:(CGRect)cagingArea
{
    if (CGRectEqualToRect(cagingArea, CGRectZero) ||
        CGRectContainsRect(cagingArea, self.frame)) {
        NSValue *cagingAreaValue = [NSValue valueWithCGRect:cagingArea];
        objc_setAssociatedObject(self, @selector(db_cagingArea), cagingAreaValue, OBJC_ASSOCIATION_RETAIN);
    }
}

- (CGRect)db_cagingArea
{
    NSValue *cagingAreaValue = objc_getAssociatedObject(self, @selector(db_cagingArea));
    return [cagingAreaValue CGRectValue];
}

- (void)setDb_handle:(CGRect)handle
{
    CGRect relativeFrame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    if (CGRectContainsRect(relativeFrame, handle)) {
        NSValue *handleValue = [NSValue valueWithCGRect:handle];
        objc_setAssociatedObject(self, @selector(db_handle), handleValue, OBJC_ASSOCIATION_RETAIN);
    }
}

- (CGRect)db_handle
{
    NSValue *handleValue = objc_getAssociatedObject(self, @selector(db_handle));
    return [handleValue CGRectValue];
}

- (void)setDb_shouldMoveAlongY:(BOOL)newShould
{
    NSNumber *shouldMoveAlongYBool = [NSNumber numberWithBool:newShould];
    objc_setAssociatedObject(self, @selector(db_shouldMoveAlongY), shouldMoveAlongYBool, OBJC_ASSOCIATION_RETAIN );
}

- (BOOL)db_shouldMoveAlongY
{
    NSNumber *moveAlongY = objc_getAssociatedObject(self, @selector(db_shouldMoveAlongY));
    return (moveAlongY) ? [moveAlongY boolValue] : YES;
}

- (void)setDb_shouldMoveAlongX:(BOOL)newShould
{
    NSNumber *shouldMoveAlongXBool = [NSNumber numberWithBool:newShould];
    objc_setAssociatedObject(self, @selector(db_shouldMoveAlongX), shouldMoveAlongXBool, OBJC_ASSOCIATION_RETAIN );
}

- (BOOL)db_shouldMoveAlongX
{
    NSNumber *moveAlongX = objc_getAssociatedObject(self, @selector(db_shouldMoveAlongX));
    return (moveAlongX) ? [moveAlongX boolValue] : YES;
}

- (void)setDb_draggingStartedBlock:(void (^)(void))draggingStartedBlock
{
    objc_setAssociatedObject(self, @selector(db_draggingStartedBlock), draggingStartedBlock, OBJC_ASSOCIATION_RETAIN);
}

- (void (^)(void))db_draggingStartedBlock
{
    return objc_getAssociatedObject(self, @selector(db_draggingStartedBlock));
}

- (void)setDb_draggingEndedBlock:(void (^)(void))draggingEndedBlock
{
    objc_setAssociatedObject(self, @selector(db_draggingEndedBlock), draggingEndedBlock, OBJC_ASSOCIATION_RETAIN);
}

- (void (^)(void))db_draggingEndedBlock
{
    return objc_getAssociatedObject(self, @selector(db_draggingEndedBlock));
}

- (void)db_handlePan:(UIPanGestureRecognizer*)sender
{
    // Check to make you drag from dragging area
    CGPoint locationInView = [sender locationInView:self];
    if (!CGRectContainsPoint(self.db_handle, locationInView)) {
        return;
    }
    
    [self db_adjustAnchorPointForGestureRecognizer:sender];
    
    if (sender.state == UIGestureRecognizerStateBegan && self.db_draggingStartedBlock) {
        self.db_draggingStartedBlock();
    }
    
    if (sender.state == UIGestureRecognizerStateEnded && self.db_draggingEndedBlock) {
        self.db_draggingEndedBlock();
    }
    
    CGPoint translation = [sender translationInView:[self superview]];
    
    CGFloat newXOrigin = CGRectGetMinX(self.frame) + (([self db_shouldMoveAlongX]) ? translation.x : 0);
    CGFloat newYOrigin = CGRectGetMinY(self.frame) + (([self db_shouldMoveAlongY]) ? translation.y : 0);
    
    CGRect cagingArea = self.db_cagingArea;
    
    CGFloat cagingAreaOriginX = CGRectGetMinX(cagingArea);
    CGFloat cagingAreaOriginY = CGRectGetMinY(cagingArea);
    
    CGFloat cagingAreaRightSide = cagingAreaOriginX + CGRectGetWidth(cagingArea);
    CGFloat cagingAreaBottomSide = cagingAreaOriginY + CGRectGetHeight(cagingArea);
    
    if (!CGRectEqualToRect(cagingArea, CGRectZero)) {
        
        // Check to make sure the view is still within the caging area
        if (newXOrigin <= cagingAreaOriginX ||
            newYOrigin <= cagingAreaOriginY ||
            newXOrigin + CGRectGetWidth(self.frame) >= cagingAreaRightSide ||
            newYOrigin + CGRectGetHeight(self.frame) >= cagingAreaBottomSide) {
            
            // Don't move
            newXOrigin = CGRectGetMinX(self.frame);
            newYOrigin = CGRectGetMinY(self.frame);
        }
    }
    
    [self setFrame:CGRectMake(newXOrigin,
                              newYOrigin,
                              CGRectGetWidth(self.frame),
                              CGRectGetHeight(self.frame))];
    
    [sender setTranslation:(CGPoint){0, 0} inView:[self superview]];
}

- (void)db_adjustAnchorPointForGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        UIView *piece = self;
        CGPoint locationInView = [gestureRecognizer locationInView:piece];
        CGPoint locationInSuperview = [gestureRecognizer locationInView:piece.superview];
        
        piece.layer.anchorPoint = CGPointMake(locationInView.x / piece.bounds.size.width, locationInView.y / piece.bounds.size.height);
        piece.center = locationInSuperview;
    }
}

- (void)db_setDraggable:(BOOL)draggable
{
    [self.db_panGesture setEnabled:draggable];
}

- (void)db_enableDragging
{
    self.db_panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(db_handlePan:)];
    [self.db_panGesture setMaximumNumberOfTouches:1];
    [self.db_panGesture setMinimumNumberOfTouches:1];
    [self.db_panGesture setCancelsTouchesInView:NO];
    [self setDb_handle:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self addGestureRecognizer:self.db_panGesture];
}

@end

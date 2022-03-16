//
//  UIView+DBDraggable.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/27.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DBDraggable)

/** The pan gestures that handles the view dragging
 db_panGesture The tint color of the blurred view. Set to nil to reset.
 */
@property (nonatomic) UIPanGestureRecognizer *db_panGesture;

/**
 A caging area such that the view can not be moved outside
 of this frame.
 
 If @c cagingArea is not @c CGRectZero, and @c cagingArea does not contain the
 view's frame then this does nothing (ie. if the bounds of the view extend the
 bounds of @c cagingArea).
 
 Optional. If not set, defaults to @c CGRectZero, which will result
 in no caging behavior.
 */
@property (nonatomic) CGRect db_cagingArea;

/**
 Restricts the area of the view where the drag action starts.
 
 Optional. If not set, defaults to self.view.
 */
@property (nonatomic) CGRect db_handle;

/**
 Restricts the movement along the X axis
 */
@property (nonatomic) BOOL db_shouldMoveAlongX;

/**
 Restricts the movement along the Y axis
 */
@property (nonatomic) BOOL db_shouldMoveAlongY;

/**
 Notifies when dragging started
 */
@property (nonatomic, copy) void (^db_draggingStartedBlock)(void);

/**
 Notifies when dragging ended
 */
@property (nonatomic, copy) void (^db_draggingEndedBlock)(void);

/** Enables the dragging
 *
 * Enables the dragging state of the view
 */
- (void)db_enableDragging;

/** Disable or enable the view dragging
 *
 * @param draggable The boolean that enables or disables the draggable state
 */
- (void)db_setDraggable:(BOOL)draggable;

@end

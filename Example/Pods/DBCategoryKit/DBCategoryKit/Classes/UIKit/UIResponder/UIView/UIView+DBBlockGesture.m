//
//  UIView+DBBlockGesture.m
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/26.
//  Copyright © 2018年 DB. All rights reserved.
//

#import "UIView+DBBlockGesture.h"
#import <objc/runtime.h>

static char db_kActionHandlerTapBlockKey;
static char db_kActionHandlerTapGestureKey;
static char db_kActionHandlerLongPressBlockKey;
static char db_kActionHandlerLongPressGestureKey;

@implementation UIView (DBBlockGesture)

- (void)db_addTapActionWithBlock:(DBGestureActionBlock)block{
    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &db_kActionHandlerTapGestureKey);
    if (!gesture)
    {
        gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(db_handleActionForTapGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &db_kActionHandlerTapGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &db_kActionHandlerTapBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)db_handleActionForTapGesture:(UITapGestureRecognizer*)gesture
{
    if (gesture.state == UIGestureRecognizerStateRecognized)
    {
        DBGestureActionBlock block = objc_getAssociatedObject(self, &db_kActionHandlerTapBlockKey);
        if (block)
        {
            block(gesture);
        }
    }
}

- (void)db_addLongPressActionWithBlock:(DBGestureActionBlock)block
{
    UILongPressGestureRecognizer *gesture = objc_getAssociatedObject(self, &db_kActionHandlerLongPressGestureKey);
    if (!gesture)
    {
        gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(db_handleActionForLongPressGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &db_kActionHandlerLongPressGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &db_kActionHandlerLongPressBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)db_handleActionForLongPressGesture:(UITapGestureRecognizer*)gesture
{
    if (gesture.state == UIGestureRecognizerStateRecognized)
    {
        DBGestureActionBlock block = objc_getAssociatedObject(self, &db_kActionHandlerLongPressBlockKey);
        if (block)
        {
            block(gesture);
        }
    }
}

@end

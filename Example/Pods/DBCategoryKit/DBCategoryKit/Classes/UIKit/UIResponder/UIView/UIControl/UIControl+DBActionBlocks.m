//
//  UIControl+DBActionBlocks.m
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/28.
//  Copyright © 2018年 DB. All rights reserved.
//

#import "UIControl+DBActionBlocks.h"
#import <objc/runtime.h>

static const void *UIControldbActionBlockArray = &UIControldbActionBlockArray;

@implementation UIControldbActionBlockWrapper

- (void)db_invokeBlock:(id)sender {
    if (self.db_actionBlock) {
        self.db_actionBlock(sender);
    }
}

@end

@implementation UIControl (DBActionBlocks)

-(void)db_handleControlEvents:(UIControlEvents)controlEvents withBlock:(UIControldbActionBlock)actionBlock {
    NSMutableArray *actionBlocksArray = [self db_actionBlocksArray];
    
    UIControldbActionBlockWrapper *blockActionWrapper = [[UIControldbActionBlockWrapper alloc] init];
    blockActionWrapper.db_actionBlock = actionBlock;
    blockActionWrapper.db_controlEvents = controlEvents;
    [actionBlocksArray addObject:blockActionWrapper];
    
    [self addTarget:blockActionWrapper action:@selector(db_invokeBlock:) forControlEvents:controlEvents];
}

- (void)db_removeActionBlocksForControlEvents:(UIControlEvents)controlEvents {
    NSMutableArray *actionBlocksArray = [self db_actionBlocksArray];
    NSMutableArray *wrappersToRemove = [NSMutableArray arrayWithCapacity:[actionBlocksArray count]];
    
    [actionBlocksArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIControldbActionBlockWrapper *wrapperTmp = obj;
        if (wrapperTmp.db_controlEvents == controlEvents) {
            [wrappersToRemove addObject:wrapperTmp];
            [self removeTarget:wrapperTmp action:@selector(db_invokeBlock:) forControlEvents:controlEvents];
        }
    }];
    
    [actionBlocksArray removeObjectsInArray:wrappersToRemove];
}

- (NSMutableArray *)db_actionBlocksArray {
    NSMutableArray *actionBlocksArray = objc_getAssociatedObject(self, UIControldbActionBlockArray);
    if (!actionBlocksArray) {
        actionBlocksArray = [NSMutableArray array];
        objc_setAssociatedObject(self, UIControldbActionBlockArray, actionBlocksArray, OBJC_ASSOCIATION_RETAIN);
    }
    return actionBlocksArray;
}

@end

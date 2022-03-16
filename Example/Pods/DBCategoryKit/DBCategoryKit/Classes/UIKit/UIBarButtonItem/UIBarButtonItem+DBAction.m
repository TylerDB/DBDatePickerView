//
//  UIBarButtonItem+DBAction.m
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/28.
//  Copyright © 2018年 DB. All rights reserved.
//

#import "UIBarButtonItem+DBAction.h"
#import <objc/runtime.h>

char * const DBBarButtonItemActionBlock = "DBBarButtonItemActionBlock";

@implementation UIBarButtonItem (DBAction)

- (void)db_performActionBlock {
    if (self.db_actionBlock)
        self.db_actionBlock(self);
}

- (DBBarButtonActionBlock)db_actionBlock {
    return objc_getAssociatedObject(self, DBBarButtonItemActionBlock);
}

- (void)setDb_actionBlock:(DBBarButtonActionBlock)actionBlock
{
    
    if (actionBlock != self.db_actionBlock) {
        [self willChangeValueForKey:@"db_actionBlock"];
        
        objc_setAssociatedObject(self,
                                 DBBarButtonItemActionBlock,
                                 actionBlock,
                                 OBJC_ASSOCIATION_COPY);
        
        // Sets up the action.
        [self setTarget:self];
        [self setAction:@selector(db_performActionBlock)];
        
        [self didChangeValueForKey:@"db_actionBlock"];
    }
}

- (instancetype)initWithImage:(nullable UIImage *)image block:(DBBarButtonActionBlock)block{
    self = [self initWithImage:image style:UIBarButtonItemStylePlain target:nil action:NULL];
    if (self) {
        self.db_actionBlock = block;
    }
    return self;
}

-(instancetype)initWithImage:(nullable UIImage *)image landscapeImagePhone:(nullable UIImage *)landscapeImagePhone block:(DBBarButtonActionBlock)block{
    self = [self initWithImage:image landscapeImagePhone:landscapeImagePhone style:UIBarButtonItemStylePlain target:nil action:NULL];
    if (self) {
        self.db_actionBlock = block;
    }
    return self;
}

-(instancetype)initWithTitle:(nullable NSString *)title block:(DBBarButtonActionBlock)block{
    self = [self initWithTitle:title style:UIBarButtonItemStylePlain target:nil action:NULL];
    if (self) {
        self.db_actionBlock = block;
    }
    return self;
}

-(instancetype)initWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem block:(DBBarButtonActionBlock)block{
    self = [self initWithBarButtonSystemItem:systemItem target:nil action:NULL];
    if (self) {
        self.db_actionBlock = block;
    }
    return self;
}

@end

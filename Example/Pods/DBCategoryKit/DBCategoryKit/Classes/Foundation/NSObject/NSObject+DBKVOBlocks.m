//
//  NSObject+DBKVOBlocks.m
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/5.
//  Copyright © 2019年 DB. All rights reserved.
//

#import "NSObject+DBKVOBlocks.h"
#import <objc/runtime.h>

@implementation NSObject (DBKVOBlocks)

- (void)db_addObserver:(NSObject *)observer
           forKeyPath:(NSString *)keyPath
              options:(NSKeyValueObservingOptions)options
              context:(void *)context
            withBlock:(DBKVOBlock)block {
    
    objc_setAssociatedObject(observer, (__bridge const void *)(keyPath), block, OBJC_ASSOCIATION_COPY);
    [self addObserver:observer forKeyPath:keyPath options:options context:context];
}

- (void)db_removeBlockObserver:(NSObject *)observer
                   forKeyPath:(NSString *)keyPath {
    objc_setAssociatedObject(observer, (__bridge const void *)(keyPath), nil, OBJC_ASSOCIATION_COPY);
    [self removeObserver:observer forKeyPath:keyPath];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context {
    
    DBKVOBlock block = objc_getAssociatedObject(self, (__bridge const void *)(keyPath));
    if (block) {
        block(change, context);
    }
}

- (void)db_addObserverForKeyPath:(NSString *)keyPath
                        options:(NSKeyValueObservingOptions)options
                        context:(void *)context
                      withBlock:(DBKVOBlock)block {
    
    [self db_addObserver:self forKeyPath:keyPath options:options context:context withBlock:block];
}

- (void)db_removeBlockObserverForKeyPath:(NSString *)keyPath {
    [self db_removeBlockObserver:self forKeyPath:keyPath];
}

@end

//
//  UIControl+DBActionBlocks.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/28.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^UIControldbActionBlock)(id weakSender);

@interface UIControldbActionBlockWrapper : NSObject

@property (nonatomic, copy) UIControldbActionBlock db_actionBlock;
@property (nonatomic, assign) UIControlEvents db_controlEvents;

- (void)db_invokeBlock:(id)sender;

@end

@interface UIControl (DBActionBlocks)

- (void)db_handleControlEvents:(UIControlEvents)controlEvents withBlock:(UIControldbActionBlock)actionBlock;
- (void)db_removeActionBlocksForControlEvents:(UIControlEvents)controlEvents;

@end

NS_ASSUME_NONNULL_END

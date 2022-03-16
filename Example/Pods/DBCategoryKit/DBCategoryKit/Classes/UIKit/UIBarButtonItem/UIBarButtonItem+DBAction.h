//
//  UIBarButtonItem+DBAction.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/28.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^DBBarButtonActionBlock)(UIBarButtonItem * __nonnull barButtonItem);

@interface UIBarButtonItem (DBAction)

@property (nonatomic,copy,nullable) DBBarButtonActionBlock db_actionBlock;

- (void)setDb_actionBlock:(DBBarButtonActionBlock)actionBlock;

- (instancetype)initWithImage:(nullable UIImage *)image block:(nullable DBBarButtonActionBlock)block;

- (instancetype)initWithImage:(nullable UIImage *)image landscapeImagePhone:(nullable UIImage *)landscapeImagePhone block:(nullable DBBarButtonActionBlock)block;

- (instancetype)initWithTitle:(nullable NSString *)title block:(nullable DBBarButtonActionBlock)block;

- (instancetype)initWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem block:(nullable DBBarButtonActionBlock)block;

@end

NS_ASSUME_NONNULL_END

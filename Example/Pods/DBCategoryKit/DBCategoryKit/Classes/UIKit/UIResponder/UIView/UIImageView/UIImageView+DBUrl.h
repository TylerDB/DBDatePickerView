//
//  UIImageView+DBUrl.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/27.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (DBUrl)

- (void)db_setImageWithUrl:(NSString *)urlString placeholderImage:(UIImage *)placeholder;

@end

NS_ASSUME_NONNULL_END

//
//  UIImageView+DBLetters.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/27.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (DBLetters)

//文字生成图片
- (void)db_setImageWithString:(NSString *)string color:(UIColor *)color circular:(BOOL)isCircular textAttributes:(NSDictionary *)textAttributes;

@end

NS_ASSUME_NONNULL_END

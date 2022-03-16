//
//  UIImage+DBRoundedCorner.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/27.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (DBRoundedCorner)

- (UIImage *)db_roundedCornerImage:(NSInteger)cornerSize borderSize:(NSInteger)borderSize;

@end

NS_ASSUME_NONNULL_END

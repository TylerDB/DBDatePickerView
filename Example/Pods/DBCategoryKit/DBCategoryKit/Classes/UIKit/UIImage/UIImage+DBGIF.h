//
//  UIImage+DBGif.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/27.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (DBGIF)

+ (UIImage *)db_animatedGIFNamed:(NSString *)name;

+ (UIImage *)db_animatedGIFWithData:(NSData *)data;

- (UIImage *)db_animatedImageByScalingAndCroppingToSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END

//
//  UIButton+DBImagePosition.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/28.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, DBImagePosition) {
    DBImagePositionLeft = 0,              //图片在左，文字在右，默认
    DBImagePositionRight = 1,             //图片在右，文字在左
    DBImagePositionTop = 2,               //图片在上，文字在下
    DBImagePositionBottom = 3,            //图片在下，文字在上
};

@interface UIButton (DBImagePosition)

/**
 *  利用UIButton的titleEdgeInsets和imageEdgeInsets来实现文字和图片的自由排列
 *  注意：这个方法需要在设置图片和文字之后才可以调用，且button的大小要大于 图片大小+文字大小+spacing
 *
 *  @param spacing 图片和文字的间隔
 */
- (void)db_setImagePosition:(DBImagePosition)postion spacing:(CGFloat)spacing;

@end

NS_ASSUME_NONNULL_END

//
//  UIImageView+DBBetterFace.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/27.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (DBBetterFace)

@property (nonatomic) BOOL db_needsBetterFace;
@property (nonatomic) BOOL db_fast;

void db_hack_uiimageview_bf(void);
- (void)db_setBetterFaceImage:(UIImage *)image;

@end

NS_ASSUME_NONNULL_END

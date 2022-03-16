//
//  UIImageView+DBFaceAwareFill.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/27.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (DBFaceAwareFill)

//Ask the image to perform an "Aspect Fill" but centering the image to the detected faces
//Not the simple center of the image
- (void)db_faceAwareFill;

@end

NS_ASSUME_NONNULL_END

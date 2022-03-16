//
//  UITextView+DBInputLimit.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/29.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextView (DBInputLimit)

@property (assign, nonatomic)  NSInteger db_maxLength;//if <=0, no limit

@end

NS_ASSUME_NONNULL_END

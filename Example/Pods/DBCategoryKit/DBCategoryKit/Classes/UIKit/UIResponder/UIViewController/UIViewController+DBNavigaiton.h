//
//  UIViewController+DBNavigaiton.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/27.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (DBNavigaiton)

@property (nonatomic,strong,nullable) NSString *navigationTitle;

//需要与 UINavigationController 配合使用
@property (nonatomic,assign) BOOL disablePopGesture;
@property (nonatomic,assign) BOOL dismissFromParent;

@end

NS_ASSUME_NONNULL_END

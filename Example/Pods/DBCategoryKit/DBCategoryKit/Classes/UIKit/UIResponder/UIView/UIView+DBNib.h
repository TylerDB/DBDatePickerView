//
//  UIView+DBNib.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/26.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface UIView (DBNib)

+ (UINib *)db_loadNib;
+ (UINib *)db_loadNibNamed:(NSString*)nibName;
+ (UINib *)db_loadNibNamed:(NSString*)nibName bundle:(NSBundle *)bundle;

+ (instancetype)db_loadInstanceFromNib;
+ (instancetype)db_loadInstanceFromNibWithName:(NSString *)nibName;
+ (instancetype)db_loadInstanceFromNibWithName:(NSString *)nibName owner:(id)owner;
+ (instancetype)db_loadInstanceFromNibWithName:(NSString *)nibName owner:(id)owner bundle:(NSBundle *)bundle;

@end

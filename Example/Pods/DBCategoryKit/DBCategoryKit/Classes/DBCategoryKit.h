//
//  DBCategoryKit.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/26.
//  Copyright © 2018年 DB. All rights reserved.
//

#import <UIKit/UIKit.h>

#if __has_include(<DBCategoryKit/DBCategoryKit.h>)

FOUNDATION_EXPORT double DBCategoryKitVersionNumber;
//! Project version string for DBCategoryKit.
FOUNDATION_EXPORT const unsigned char DBCategoryKitVersionString[];
// In this header, you should import all the public headers of your framework using statements like #import <DBCategoryKit/PublicHeader.h>

#import <DBCategoryKit/DBUIKit.h>
#import <DBCategoryKit/DBQuartzCore.h>
#import <DBCategoryKit/DBCoreData.h>
#import <DBCategoryKit/DBFoundation.h>

#else

#import "DBUIKit.h"
#import "DBQuartzCore.h"
#import "DBCoreData.h"
#import "DBFoundation.h"

#endif

//
//  DBCoreData.h
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/26.
//  Copyright © 2018年 DB. All rights reserved.
//

#if __has_include(<DBCategoryKit/DBCoreData.h>)

#import <DBCategoryKit/NSFetchRequest+DBExtensions.h>
#import <DBCategoryKit/NSManagedObject+DBDictionary.h>
#import <DBCategoryKit/NSManagedObject+DBExtensions.h>
#import <DBCategoryKit/NSManagedObjectContext+DBExtensions.h>
#import <DBCategoryKit/NSManagedObjectContext+DBFetching.h>
#import <DBCategoryKit/NSManagedObjectContext+DBFetchRequestsConstructors.h>
#import <DBCategoryKit/NSManagedObjectContext+DBObjectClear.h>

#else

#import "NSFetchRequest+DBExtensions.h"
#import "NSManagedObject+DBDictionary.h"
#import "NSManagedObject+DBExtensions.h"
#import "NSManagedObjectContext+DBExtensions.h"
#import "NSManagedObjectContext+DBFetching.h"
#import "NSManagedObjectContext+DBFetchRequestsConstructors.h"
#import "NSManagedObjectContext+DBObjectClear.h"

#endif

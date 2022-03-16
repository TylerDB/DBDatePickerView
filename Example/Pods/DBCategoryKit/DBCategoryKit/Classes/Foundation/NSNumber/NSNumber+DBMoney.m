//
//  NSNumber+DBMoney.m
//  DBCategoryKit_Example
//
//  Created by DB on 2019/1/3.
//  Copyright © 2019年 DB. All rights reserved.
//

#import "NSNumber+DBMoney.h"

@implementation NSNumber (DBMoney)

-(NSString *)db_displayPrice{
    return [NSString stringWithFormat:@"¥%.2f",self.doubleValue];
}

-(NSString *)db_formatPrice{
    return [NSString stringWithFormat:@"%.2f",self.doubleValue];
}

@end

//
//  UIApplication+DBKeyboardFrame.m
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/28.
//  Copyright © 2018年 DB. All rights reserved.
//

#import "UIApplication+DBKeyboardFrame.h"

@implementation UIApplication (DBKeyboardFrame)

static CGRect _db_keyboardFrame = (CGRect){ (CGPoint){ 0.0f, 0.0f }, (CGSize){ 0.0f, 0.0f } };

- (CGRect)db_keyboardFrame {
    return _db_keyboardFrame;
}

+ (void)initialize
{
    [NSNotificationCenter.defaultCenter addObserverForName:UIKeyboardDidShowNotification object:nil queue:nil usingBlock:^(NSNotification *note)
     {
         _db_keyboardFrame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
     }];
    [NSNotificationCenter.defaultCenter addObserverForName:UIKeyboardDidChangeFrameNotification object:nil queue:nil usingBlock:^(NSNotification *note)
     {
         _db_keyboardFrame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
     }];
    [NSNotificationCenter.defaultCenter addObserverForName:UIKeyboardDidHideNotification object:nil queue:nil usingBlock:^(NSNotification *note)
     {
         _db_keyboardFrame = CGRectZero;
     }];
}

@end

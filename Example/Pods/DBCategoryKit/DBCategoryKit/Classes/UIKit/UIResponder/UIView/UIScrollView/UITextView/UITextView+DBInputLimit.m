//
//  UITextView+DBInputLimit.m
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/29.
//  Copyright © 2018年 DB. All rights reserved.
//

#import "UITextView+DBInputLimit.h"
#import <objc/runtime.h>

static const void *DBTextViewInputLimitMaxLength = &DBTextViewInputLimitMaxLength;

@implementation UITextView (DBInputLimit)

- (NSInteger)db_maxLength {
    return [objc_getAssociatedObject(self, DBTextViewInputLimitMaxLength) integerValue];
}

- (void)setDb_maxLength:(NSInteger)maxLength {
    objc_setAssociatedObject(self, DBTextViewInputLimitMaxLength, @(maxLength), OBJC_ASSOCIATION_ASSIGN);
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(db_textViewTextDidChange:)
                                                name:@"UITextViewTextDidChangeNotification" object:self];
    
}

- (void)db_textViewTextDidChange:(NSNotification *)notification {
    NSString *toBeString = self.text;
    //获取高亮部分
    UITextRange *selectedRange = [self markedTextRange];
    UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
    
    //没有高亮选择的字，则对已输入的文字进行字数统计和限制
    //在iOS7下,position对象总是不为nil
    if ( (!position ||!selectedRange) && (self.db_maxLength > 0 && toBeString.length > self.db_maxLength))
    {
        NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:self.db_maxLength];
        if (rangeIndex.length == 1)
        {
            self.text = [toBeString substringToIndex:self.db_maxLength];
        }
        else
        {
            NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, self.db_maxLength)];
            NSInteger tmpLength;
            if (rangeRange.length > self.db_maxLength) {
                tmpLength = rangeRange.length - rangeIndex.length;
            }else{
                tmpLength = rangeRange.length;
            }
            self.text = [toBeString substringWithRange:NSMakeRange(0, tmpLength)];
        }
    }
}

+ (void)initialize {
    Method origMethod = class_getInstanceMethod([self class], NSSelectorFromString(@"dealloc"));
    Method newMethod = class_getInstanceMethod([self class], @selector(db_textView_limit_swizzledDealloc));
    method_exchangeImplementations(origMethod, newMethod);
}

- (void)db_textView_limit_swizzledDealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self db_textView_limit_swizzledDealloc];
}

@end

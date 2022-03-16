//
//  UILabel+DBAdjustable.m
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/28.
//  Copyright © 2018年 DB. All rights reserved.
//

#import "UILabel+DBAdjustable.h"

@implementation UILabel (DBAdjustable)

- (void)db_adjustLabelToMaximumSize:(CGSize)maxSize
                        minimumSize:(CGSize)minSize
                    minimumFontSize:(int)minFontSize
{
    //// 1) Calculate new label size
    //// ---------------------------
    // First, reset some basic parameters
    [self setNumberOfLines:0];
    [self setLineBreakMode:NSLineBreakByWordWrapping];
    
    // If maxSize is set to CGSizeZero, then assume the max width
    // is the size of the device screen minus the default
    // recommended edge distances (2 * 20)
    if (maxSize.height == CGSizeZero.height) {
        maxSize.width = [[UIScreen mainScreen] bounds].size.width - 40.0;
        maxSize.height = MAXFLOAT; // infinite height
        
    }
    
    // Now, calculate the size of the label constrained to maxSize
    CGSize tempSize = [[self text] sizeWithFont:[self font]
                              constrainedToSize:maxSize
                                  lineBreakMode:[self lineBreakMode]];
    
    // If minSize is specified (not CGSizeZero) then
    // check if the new calculated size is smaller than
    // the minimum size
    if (minSize.height != CGSizeZero.height) {
        if (tempSize.width <= minSize.width) tempSize.width = minSize.width;
        if (tempSize.height <= minSize.height) tempSize.height = minSize.height;
    }
    
    // Create rect
    CGRect newFrameSize = CGRectMake(  [self frame].origin.x
                                     , [self frame].origin.y
                                     , tempSize.width
                                     , tempSize.height);
    
    //// 2) Change the font size if necessary
    //// ------------------------------------
    UIFont *labelFont = [self font]; // temporary label object
    CGFloat fSize = [labelFont pointSize]; // temporary font size value
    CGSize calculatedSizeWithCurrentFontSize; // temporary frame size
    
    // Calculate label size as if there was no constrain
    CGSize unconstrainedSize = CGSizeMake(tempSize.width, MAXFLOAT);
    
    // Keep reducing the font size until the calculated frame size
    // is smaller than the maxSize parameter
    do {
        // Create a temporary font object
        labelFont = [UIFont fontWithName:[labelFont fontName]
                                    size:fSize];
        // Calculate the frame size
        calculatedSizeWithCurrentFontSize =
        [[self text] sizeWithFont:labelFont
                constrainedToSize:unconstrainedSize
                    lineBreakMode:NSLineBreakByWordWrapping];
        // Reduce the temporary font size value
        fSize--;
    } while (calculatedSizeWithCurrentFontSize.height > maxSize.height);
    
    // Reset the font size to the last calculated value
    [self setFont:labelFont];
    
    // Reset the frame size
    [self setFrame:newFrameSize];
    
}

// Adjust label using only the maximum size and the
// font size as constraints
// =====================================================
- (void)db_adjustLabelToMaximumSize:(CGSize)maxSize
                    minimumFontSize:(int)minFontSize
{
    [self db_adjustLabelToMaximumSize:maxSize
                          minimumSize:CGSizeZero
                      minimumFontSize:minFontSize];
}

// Adjust the size of the label using only the font
// size as a constraint (the maximum size will be
// calculated automatically based on the screen size)
// =====================================================
- (void)db_adjustLabelSizeWithMinimumFontSize:(int)minFontSize
{
    [self db_adjustLabelToMaximumSize:CGSizeZero
                          minimumSize:CGSizeZero
                      minimumFontSize:minFontSize];
}

// Adjust label without any constraints (the maximum
// size will be calculated automatically based on the
// screen size)
// =====================================================
- (void)db_adjustLabel
{
    [self db_adjustLabelToMaximumSize:CGSizeZero
                          minimumSize:CGSizeZero
                      minimumFontSize:[self minimumScaleFactor]];
}

- (CGSize)db_suggestedSizeForWidth:(CGFloat)width {
    if (self.attributedText)
        return [self db_suggestSizeForAttributedString:self.attributedText width:width];
    
    return [self db_suggestSizeForString:self.text width:width];
}

- (CGSize)db_suggestSizeForAttributedString:(NSAttributedString *)string width:(CGFloat)width {
    if (!string) {
        return CGSizeZero;
    }
    return [string boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;
}

- (CGSize)db_suggestSizeForString:(NSString *)string width:(CGFloat)width {
    if (!string) {
        return CGSizeZero;
    }
    return [self db_suggestSizeForAttributedString:[[NSAttributedString alloc] initWithString:string attributes:@{NSFontAttributeName: self.font}] width:width];
}

- (UILabel *)db_resizeLabelHorizontal{
    return [self db_resizeLabelHorizontal:0];
}

- (UILabel *)db_resizeLabelVertical{
    return [self db_resizeLabelVertical:0];
}

- (UILabel *)db_resizeLabelVertical:(CGFloat)minimumHeigh{
    CGRect newFrame = self.frame;
    CGSize constrainedSize = CGSizeMake(newFrame.size.width, CGFLOAT_MAX);
    NSString *text = self.text;
    UIFont *font = self.font;
    CGSize size = CGSizeZero;
    if ([text respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
        NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
        
        size = [text boundingRectWithSize:constrainedSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    }else{
#if (defined(__IPHONE_OS_VERSION_MIN_REQUIRED) && __IPHONE_OS_VERSION_MIN_REQUIRED <= 60000)
        size = [text sizeWithFont:font constrainedToSize:constrainedSize lineBreakMode:NSLineBreakByWordWrapping];
#endif
    }
    newFrame.size.height = ceilf(size.height);
    if(minimumHeigh > 0){
        newFrame.size.height = (newFrame.size.height < minimumHeigh ? minimumHeigh : newFrame.size.height);
    }
    self.frame = newFrame;
    return self;
}

- (UILabel *)db_resizeLabelHorizontal:(CGFloat)minimumWidth{
    CGRect newFrame = self.frame;
    CGSize constrainedSize = CGSizeMake(CGFLOAT_MAX, newFrame.size.height);
    NSString *text = self.text;
    UIFont *font = self.font;
    CGSize size = CGSizeZero;
    if ([text respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
        NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
        
        size = [text boundingRectWithSize:constrainedSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    }else{
#if (defined(__IPHONE_OS_VERSION_MIN_REQUIRED) && __IPHONE_OS_VERSION_MIN_REQUIRED <= 60000)
        size = [text sizeWithFont:font constrainedToSize:constrainedSize lineBreakMode:NSLineBreakByWordWrapping];
#endif
    }
    newFrame.size.width = ceilf(size.width);
    if(minimumWidth > 0){
        newFrame.size.width = (newFrame.size.width < minimumWidth ? minimumWidth: newFrame.size.width);
    }
    self.frame = newFrame;
    return self;
}

@end

//
//  UIImageView+DBAddition.m
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/27.
//  Copyright © 2018年 DB. All rights reserved.
//

#import "UIImageView+DBAddition.h"

@implementation UIImageView (DBAddition)

+ (id)db_imageViewWithImageNamed:(NSString*)imageName
{
    return [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
}

+ (id)db_imageViewWithFrame:(CGRect)frame
{
    return [[UIImageView alloc] initWithFrame:frame];
}

+ (id)db_imageViewWithStretchableImage:(NSString*)imageName Frame:(CGRect)frame
{
    UIImage *image =[UIImage imageNamed:imageName];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image = [image stretchableImageWithLeftCapWidth:image.size.width/2 topCapHeight:image.size.height/2];
    return imageView;
}

- (void)db_setImageWithStretchableImage:(NSString*)imageName
{
    UIImage *image =[UIImage imageNamed:imageName];
    self.image = [image stretchableImageWithLeftCapWidth:image.size.width/2 topCapHeight:image.size.height/2];
}

+ (id)db_imageViewWithImageArray:(NSArray *)imageArray duration:(NSTimeInterval)duration;
{
    if (imageArray && [imageArray count]<=0)
    {
        return nil;
    }
    UIImageView *imageView = [UIImageView db_imageViewWithImageNamed:[imageArray objectAtIndex:0]];
    NSMutableArray *images = [NSMutableArray array];
    for (NSInteger i = 0; i < imageArray.count; i++)
    {
        UIImage *image = [UIImage imageNamed:[imageArray objectAtIndex:i]];
        [images addObject:image];
    }
    [imageView setImage:[images objectAtIndex:0]];
    [imageView setAnimationImages:images];
    [imageView setAnimationDuration:duration];
    [imageView setAnimationRepeatCount:0];
    return imageView;
}

// 画水印
- (void)db_setImage:(UIImage *)image withWaterMark:(UIImage *)mark inRect:(CGRect)rect
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 4.0)
    {
        UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0.0); // 0.0 for scale means "scale for device's main screen".
    }
    //原图
    [image drawInRect:self.bounds];
    //水印图
    [mark drawInRect:rect];

    UIImage *newPic = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.image = newPic;
}

- (void)db_setImage:(UIImage *)image withStringWaterMark:(NSString *)markString inRect:(CGRect)rect color:(UIColor *)color font:(UIFont *)font
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 4.0)
    {
        UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0.0); // 0.0 for scale means "scale for device's main screen".
    }
    //原图
    [image drawInRect:self.bounds];
    //文字颜色
    [color set];
    //水印文字
    if ([markString respondsToSelector:@selector(drawInRect:withAttributes:)])
    {
        [markString drawInRect:rect withAttributes:@{NSFontAttributeName:font}];
    }
    else
    {
        // pre-iOS7.0
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        [markString drawInRect:rect withFont:font];
#pragma clang diagnostic pop
    }
    
    UIImage *newPic = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.image = newPic;
}

- (void)db_setImage:(UIImage *)image withStringWaterMark:(NSString *)markString atPoint:(CGPoint)point color:(UIColor *)color font:(UIFont *)font
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 4.0)
    {
        UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0.0); // 0.0 for scale means "scale for device's main screen".
    }
    //原图
    [image drawInRect:self.bounds];
    //文字颜色
    [color set];
    //水印文字
    
    if ([markString respondsToSelector:@selector(drawAtPoint:withAttributes:)])
    {
        [markString drawAtPoint:point withAttributes:@{NSFontAttributeName:font}];
    }
    else
    {
        // pre-iOS7.0
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        [markString drawAtPoint:point withFont:font];
#pragma clang diagnostic pop
    }
    
    UIImage *newPic = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.image = newPic;
}

@end

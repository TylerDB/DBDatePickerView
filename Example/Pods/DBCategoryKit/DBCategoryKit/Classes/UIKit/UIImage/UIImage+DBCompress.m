//
//  UIImage+DBCompress.m
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/27.
//  Copyright © 2018年 DB. All rights reserved.
//

#import "UIImage+DBCompress.h"

@implementation UIImage (DBCompress)

- (UIImage *)db_timelineCompress:(Boolean)isSession {
    CGSize size = [self _db_imageSize:isSession boundary:1280];
    UIImage *reImage = [self _db_resizedImage:size];
    NSData *data = UIImageJPEGRepresentation(reImage, 0.5);
    return [[UIImage alloc] initWithData:data];
}

- (CGSize)_db_imageSize:(Boolean)isSession boundary:(CGFloat)boundary{
    CGFloat width = self.size.width;
    CGFloat height = self.size.height;
    
    // width, height <= 1280, Size remains the same
    if (width < boundary && height < boundary) {
        return CGSizeMake(width, height);
    }
    // aspect ratio
    CGFloat ratio = MAX(width, height) / MIN(width, height);
    if (ratio <= 2) {
        CGFloat x = MAX(width, height) / boundary;
        if (width > height) {
            width = boundary;
            height = height / x;
        } else {
            height = boundary;
            width = width / x;
        }
    } else {
        // width, height > 1280
        if (MIN(width, height) >= boundary) {
            boundary = isSession ? 800 : 1280;
            // Set the smaller value to the boundary, and the larger value is compressed
            CGFloat x = MIN(width, height) / boundary;
            if (width < height) {
                width = boundary;
                height = height / x;
            } else {
                height = boundary;
                width = width / x;
            }
        }
    }
    return CGSizeMake(width, height);
}

- (UIImage *)_db_resizedImage:(CGSize)newSize {
    CGRect newRect = CGRectMake(0, 0, newSize.width, newSize.height);
    UIGraphicsBeginImageContext(newRect.size);
    UIImage *newImage = [[UIImage alloc] initWithCGImage:self.CGImage scale:1 orientation:self. imageOrientation];
    [newImage drawInRect:newRect];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage*)db_resizableHalfImage:(NSString *)name
{
    UIImage *normal = [UIImage imageNamed:name];
    
    CGFloat imageW = normal.size.width * 0.5;
    CGFloat imageH = normal.size.height * 0.5;
    return [normal resizableImageWithCapInsets:UIEdgeInsetsMake(imageH, imageW, imageH, imageW)];
}

+ (NSData *)db_compressImage:(UIImage *)image toMaxLength:(NSInteger)maxLength maxWidth:(NSInteger)maxWidth{
    NSAssert(maxLength > 0, @"图片的大小必须大于 0");
    NSAssert(maxWidth > 0, @"图片的最大边长必须大于 0");
    
    CGSize newSize = [self db_scaleImage:image withLength:maxWidth];
    UIImage *newImage = [self db_resizeImage:image withNewSize:newSize];
    
    CGFloat compress = 0.9f;
    NSData *data = UIImageJPEGRepresentation(newImage, compress);
    
    while (data.length > maxLength && compress > 0.01) {
        compress -= 0.02f;
        
        data = UIImageJPEGRepresentation(newImage, compress);
    }
    return data;
}

+ (UIImage *)db_resizeImage:(UIImage *) image withNewSize:(CGSize) newSize{
    
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (CGSize)db_scaleImage:(UIImage *) image withLength:(CGFloat) imageLength{
    
    CGFloat newWidth = 0.0f;
    CGFloat newHeight = 0.0f;
    CGFloat width = image.size.width;
    CGFloat height = image.size.height;
    
    if (width > imageLength || height > imageLength){
        
        if (width > height) {
            
            newWidth = imageLength;
            newHeight = newWidth * height / width;
            
        }else if(height > width){
            
            newHeight = imageLength;
            newWidth = newHeight * width / height;
            
        }else{
            
            newWidth = imageLength;
            newHeight = imageLength;
        }
        
    }else{
        return CGSizeMake(width, height);
    }
    
    return CGSizeMake(newWidth, newHeight);
}

@end

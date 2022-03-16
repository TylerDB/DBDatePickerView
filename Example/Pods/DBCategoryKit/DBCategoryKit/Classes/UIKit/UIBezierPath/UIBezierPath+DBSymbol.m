//
//  UIBezierPath+DBSymbol.m
//  DBCategoryKit_Example
//
//  Created by DB on 2018/12/29.
//  Copyright © 2018年 DB. All rights reserved.
//

#import "UIBezierPath+DBSymbol.h"

#define DBCGPointWithOffset(originPoint, offsetPoint) \
CGPointMake(originPoint.x + offsetPoint.x, originPoint.y + offsetPoint.y)

@implementation UIBezierPath (DBSymbol)

// plus
//
//     c-d
//     | |
//  a--b e--f
//  |       |
//  l--k h--g
//     | |
//     j-i
//
+ (UIBezierPath *)db_customBezierPathOfPlusSymbolWithRect:(CGRect)rect
                                                    scale:(CGFloat)scale {
    CGFloat height     = CGRectGetHeight(rect) * scale;
    CGFloat width      = CGRectGetWidth(rect)  * scale;
    CGFloat size       = (height < width ? height : width) * scale;
    CGFloat thick      = size / 3.f;
    CGFloat twiceThick = thick * 2.f;
    
    CGPoint offsetPoint =
    CGPointMake(CGRectGetMinX(rect) + (CGRectGetWidth(rect)  - size) / 2.f,
                CGRectGetMinY(rect) + (CGRectGetHeight(rect) - size) / 2.f);
    
    UIBezierPath * path = [self bezierPath];
    [path moveToPoint:DBCGPointWithOffset(CGPointMake(0.f, thick), offsetPoint)];                // a
    [path addLineToPoint:DBCGPointWithOffset(CGPointMake(thick, thick), offsetPoint)];           // b
    [path addLineToPoint:DBCGPointWithOffset(CGPointMake(thick, 0.f), offsetPoint)];             // c
    [path addLineToPoint:DBCGPointWithOffset(CGPointMake(twiceThick, 0.f), offsetPoint)];        // d
    [path addLineToPoint:DBCGPointWithOffset(CGPointMake(twiceThick, thick), offsetPoint)];      // e
    [path addLineToPoint:DBCGPointWithOffset(CGPointMake(size, thick), offsetPoint)];            // f
    [path addLineToPoint:DBCGPointWithOffset(CGPointMake(size, twiceThick), offsetPoint)];       // g
    [path addLineToPoint:DBCGPointWithOffset(CGPointMake(twiceThick, twiceThick), offsetPoint)]; // h
    [path addLineToPoint:DBCGPointWithOffset(CGPointMake(twiceThick, size), offsetPoint)];       // i
    [path addLineToPoint:DBCGPointWithOffset(CGPointMake(thick, size), offsetPoint)];            // j
    [path addLineToPoint:DBCGPointWithOffset(CGPointMake(thick, twiceThick), offsetPoint)];      // k
    [path addLineToPoint:DBCGPointWithOffset(CGPointMake(0.f, twiceThick), offsetPoint)];        // l
    [path closePath];
    return path;
}

// minus
+ (UIBezierPath *)db_customBezierPathOfMinusSymbolWithRect:(CGRect)rect
                                                     scale:(CGFloat)scale {
    CGFloat height = CGRectGetHeight(rect) * scale;
    CGFloat width  = CGRectGetWidth(rect)  * scale;
    CGFloat size   = height < width ? height : width;
    CGFloat thick  = size / 3.f;
    
    return [self bezierPathWithRect:
            CGRectOffset(CGRectMake(0.f, thick, size, thick),
                         CGRectGetMinX(rect) + (CGRectGetWidth(rect)  - width)  / 2.f,
                         CGRectGetMinY(rect) + (CGRectGetHeight(rect) - height) / 2.f)];
}

// check
//
//       /---------> degree = 90˚  |
//       |                         |      /----> topPointOffset = thick / √2
//   /---(----/----> thick         |    |<->|
//   |   |    |                    |    |  /b
//   |   |   d\e                   |    | /  \
//   |   |  / /                    |    a/    \
//  a/b  | / /                     |     \     \
//   \ \  / /                      |
//    \ \c /
//     \ -/--------> bottomHeight = thick * √2
//      \/
//      f     |
//      |<--->|
//         \-------> bottomMarginRight = height - topPointOffset
//
+ (UIBezierPath *)db_customBezierPathOfCheckSymbolWithRect:(CGRect)rect
                                                     scale:(CGFloat)scale
                                                     thick:(CGFloat)thick {
    CGFloat height, width;
    // height : width = 32 : 25
    if (CGRectGetHeight(rect) > CGRectGetWidth(rect)) {
        height = CGRectGetHeight(rect) * scale;
        width  = height * 32.f / 25.f;
    }
    else {
        width  = CGRectGetWidth(rect) * scale;
        height = width * 25.f / 32.f;
    }
    
    CGFloat topPointOffset    = thick / sqrt(2.f);
    CGFloat bottomHeight      = thick * sqrt(2.f);
    CGFloat bottomMarginRight = height - topPointOffset;
    CGFloat bottomMarginLeft  = width - bottomMarginRight;
    
    CGPoint offsetPoint =
    CGPointMake(CGRectGetMinX(rect) + (CGRectGetWidth(rect)  - width)  / 2.f,
                CGRectGetMinY(rect) + (CGRectGetHeight(rect) - height) / 2.f);
    
    UIBezierPath * path = [self bezierPath];
    [path moveToPoint:
     DBCGPointWithOffset(CGPointMake(0.f, height - bottomMarginLeft), offsetPoint)];                             // a
    [path addLineToPoint:
     DBCGPointWithOffset(CGPointMake(topPointOffset, height - bottomMarginLeft - topPointOffset), offsetPoint)]; // b
    [path addLineToPoint:
     DBCGPointWithOffset(CGPointMake(bottomMarginLeft, height - bottomHeight), offsetPoint)];                    // c
    [path addLineToPoint:
     DBCGPointWithOffset(CGPointMake(width - topPointOffset, 0.f), offsetPoint)];                                // d
    [path addLineToPoint:
     DBCGPointWithOffset(CGPointMake(width, topPointOffset), offsetPoint)];                                      // e
    [path addLineToPoint:
     DBCGPointWithOffset(CGPointMake(bottomMarginLeft, height), offsetPoint)];                                   // f
    [path closePath];
    return path;
}

// cross
//
//                /---> thick |
//     b       d /            |      b
//   a/ \     / \e            |     /|\
//    \  \   /  /             |    / |_/----> offset = thick / √2
//     \  \c/  /              |  a/__|  \
//      \     /               |   \      \
//       \l f/                |___________________________________
//       /   \                |
//      /  i  \               |      c  /---> thick
//     /  / \  \              |      |\/
//   k/  /   \  \g            |   l  |_\f
//    \ /     \ /             |       \----> offset
//     j       h              |      i
//
+ (UIBezierPath *)db_customBezierPathOfCrossSymbolWithRect:(CGRect)rect
                                                     scale:(CGFloat)scale
                                                     thick:(CGFloat)thick {
    CGFloat height     = CGRectGetHeight(rect) * scale;
    CGFloat width      = CGRectGetWidth(rect)  * scale;
    CGFloat halfHeight = height / 2.f;
    CGFloat halfWidth  = width  / 2.f;
    CGFloat size       = height < width ? height : width;
    CGFloat offset     = thick / sqrt(2.f);
    
    CGPoint offsetPoint =
    CGPointMake(CGRectGetMinX(rect) + (CGRectGetWidth(rect)  - size) / 2.f,
                CGRectGetMinY(rect) + (CGRectGetHeight(rect) - size) / 2.f);
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:DBCGPointWithOffset(CGPointMake(0.f, offset), offsetPoint)];                       // a
    [path addLineToPoint:DBCGPointWithOffset(CGPointMake(offset, 0.f), offsetPoint)];                    // b
    [path addLineToPoint:DBCGPointWithOffset(CGPointMake(halfWidth, halfHeight - offset), offsetPoint)]; // c
    [path addLineToPoint:DBCGPointWithOffset(CGPointMake(width - offset, 0.f), offsetPoint)];            // d
    [path addLineToPoint:DBCGPointWithOffset(CGPointMake(width, offset), offsetPoint)];                  // e
    [path addLineToPoint:DBCGPointWithOffset(CGPointMake(halfWidth + offset, halfHeight), offsetPoint)]; // f
    [path addLineToPoint:DBCGPointWithOffset(CGPointMake(width, height - offset), offsetPoint)];         // g
    [path addLineToPoint:DBCGPointWithOffset(CGPointMake(width - offset, height), offsetPoint)];         // h
    [path addLineToPoint:DBCGPointWithOffset(CGPointMake(halfWidth, halfHeight + offset), offsetPoint)]; // i
    [path addLineToPoint:DBCGPointWithOffset(CGPointMake(offset, height), offsetPoint)];                 // j
    [path addLineToPoint:DBCGPointWithOffset(CGPointMake(0.f, height - offset), offsetPoint)];           // k
    [path addLineToPoint:DBCGPointWithOffset(CGPointMake(halfWidth - offset, halfHeight), offsetPoint)]; // l
    [path closePath];
    return path;
}

// arrow
//
//            /----> thick
// LEFT:    b-c                  RIGHT:   b-c
//         / /                             \ \
//       a/ /d                             a\ \d
//        \ \                               / /
//         \ \                             / /
//          f-e                           f-e
//
//
// UP:       a                   DOWN:  f      b
//          /\                          |\    /|
//         / d\                         | \  / |
//       f/ /\ \b                       e\ \/ /c
//       | /  \ |                         \ a/
//       |/    \|                          \/
//       e      c                           d
//
+ (UIBezierPath *)db_customBezierPathOfArrowSymbolWithRect:(CGRect)rect
                                                     scale:(CGFloat)scale
                                                     thick:(CGFloat)thick
                                                 direction:(DBUIBezierPathArrowDirection)direction {
    CGFloat height     = CGRectGetHeight(rect) * scale;
    CGFloat width      = CGRectGetWidth(rect)  * scale;
    CGFloat halfHeight = height / 2.f;
    CGFloat halfWidth  = width  / 2.f;
    
    CGPoint offsetPoint =
    CGPointMake(CGRectGetMinX(rect) + (CGRectGetWidth(rect)  - width)  / 2.f,
                CGRectGetMinY(rect) + (CGRectGetHeight(rect) - height) / 2.f);
    
    UIBezierPath * path = [self bezierPath];
    if (direction == kUIBezierPathArrowDirectionLeft || direction == kUIBezierPathArrowDirectionRight) {
        if (direction == UISwipeGestureRecognizerDirectionLeft) {
            [path moveToPoint:DBCGPointWithOffset(CGPointMake(0.f, halfHeight), offsetPoint)];          // a
            [path addLineToPoint:DBCGPointWithOffset(CGPointMake(width - thick, 0.f), offsetPoint)];    // b
            [path addLineToPoint:DBCGPointWithOffset(CGPointMake(width, 0.f), offsetPoint)];            // c
            [path addLineToPoint:DBCGPointWithOffset(CGPointMake(thick, halfHeight), offsetPoint)];     // d
            [path addLineToPoint:DBCGPointWithOffset(CGPointMake(width, height), offsetPoint)];         // e
            [path addLineToPoint:DBCGPointWithOffset(CGPointMake(width - thick, height), offsetPoint)]; // f
        }
        else {
            [path moveToPoint:DBCGPointWithOffset(CGPointMake(width - thick, halfHeight), offsetPoint)]; // a
            [path addLineToPoint:DBCGPointWithOffset(CGPointMake(0.f, 0.f), offsetPoint)];               // b
            [path addLineToPoint:DBCGPointWithOffset(CGPointMake(thick, 0.f), offsetPoint)];             // c
            [path addLineToPoint:DBCGPointWithOffset(CGPointMake(width, halfHeight), offsetPoint)];      // d
            [path addLineToPoint:DBCGPointWithOffset(CGPointMake(thick, height), offsetPoint)];          // e
            [path addLineToPoint:DBCGPointWithOffset(CGPointMake(0.f, height), offsetPoint)];            // f
        }
    }
    else {
        if (direction == kUIBezierPathArrowDirectionUp) {
            [path moveToPoint:DBCGPointWithOffset(CGPointMake(halfWidth, 0.f), offsetPoint)];           // a
            [path addLineToPoint:DBCGPointWithOffset(CGPointMake(width, height - thick), offsetPoint)]; // b
            [path addLineToPoint:DBCGPointWithOffset(CGPointMake(width, height), offsetPoint)];         // c
            [path addLineToPoint:DBCGPointWithOffset(CGPointMake(halfWidth, thick), offsetPoint)];      // d
            [path addLineToPoint:DBCGPointWithOffset(CGPointMake(0.f, height), offsetPoint)];           // e
            [path addLineToPoint:DBCGPointWithOffset(CGPointMake(0.f, height - thick), offsetPoint)];   // f
        }
        else {
            [path moveToPoint:DBCGPointWithOffset(CGPointMake(halfWidth, height - thick), offsetPoint)]; // a
            [path addLineToPoint:DBCGPointWithOffset(CGPointMake(width, 0.f), offsetPoint)];             // b
            [path addLineToPoint:DBCGPointWithOffset(CGPointMake(width, thick), offsetPoint)];           // c
            [path addLineToPoint:DBCGPointWithOffset(CGPointMake(halfWidth, height), offsetPoint)];      // d
            [path addLineToPoint:DBCGPointWithOffset(CGPointMake(0.f, thick), offsetPoint)];             // e
            [path addLineToPoint:DBCGPointWithOffset(CGPointMake(0.f, 0.f), offsetPoint)];               // f
        }
    }
    [path closePath];
    return path;
}

// pencil
//
//       c  /---> thick
//       /\/
//      /  \d
//     /   /
//   b/   /
//   |   /
//  a|__/e
//     \--------> edgeWidth = thick / √2
//
+ (UIBezierPath *)db_customBezierPathOfPencilSymbolWithRect:(CGRect)rect
                                                      scale:(CGFloat)scale
                                                      thick:(CGFloat)thick {
    CGFloat height    = CGRectGetHeight(rect) * scale;
    CGFloat width     = CGRectGetWidth(rect)  * scale;
    CGFloat edgeWidth = thick / sqrt(2.f);
    
    CGPoint offsetPoint =
    CGPointMake(CGRectGetMinX(rect) + (CGRectGetWidth(rect)  - width)  / 2.f,
                CGRectGetMinY(rect) + (CGRectGetHeight(rect) - height) / 2.f);
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:DBCGPointWithOffset(CGPointMake(0.f, height), offsetPoint)];                // a
    [path addLineToPoint:DBCGPointWithOffset(CGPointMake(0.f, height - edgeWidth), offsetPoint)]; // b
    [path addLineToPoint:DBCGPointWithOffset(CGPointMake(width - edgeWidth, 0.f), offsetPoint)];  // c
    [path addLineToPoint:DBCGPointWithOffset(CGPointMake(width, edgeWidth), offsetPoint)];        // d
    [path addLineToPoint:DBCGPointWithOffset(CGPointMake(edgeWidth, height), offsetPoint)];       // e
    [path closePath];
    return path;
}

@end

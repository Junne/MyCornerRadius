//
//  UIImageView+CornerRadius.m
//  MyCornerRadius
//
//  Created by baijf on 3/28/16.
//  Copyright © 2016 Junne. All rights reserved.
//

#import "UIImageView+CornerRadius.h"

@implementation UIImageView (CornerRadius)

- (void)bf_addCornerRadius:(CGFloat)radius
{
    self.image = [self cornerWithImage:self.image cornerRadius:radius andSize:self.bounds.size];
}

- (UIImage *)cornerWithImage:(UIImage *)image cornerRadius:(CGFloat)cornerRadius andSize:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    UIBezierPath  *bezierPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    CGContextAddPath(contextRef, bezierPath.CGPath);
    CGContextClip(contextRef);
    [image drawInRect:rect];
    CGContextDrawPath(contextRef, kCGPathFillStroke);
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultImage;
}

@end

//
//  UIImage+Utility.m
//  MyDocs
//
//  Created by 김학철 on 2020/03/03.
//  Copyright © 2020 김학철. All rights reserved.
//

#import "UIImage+Utility.h"
@implementation UIImage (Utility)
- (UIImage *)imageWithTintColor:(UIColor *)tintColor {
    return [UIImage tintedImageWithColor:tintColor image:self];
}
+ (UIImage *)tintedImageWithColor:(UIColor *)tintColor image:(UIImage *)image {
    UIGraphicsBeginImageContextWithOptions(image.size, NO, [[UIScreen mainScreen] scale]);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextTranslateCTM(context, 0, image.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    
    // draw alpha-mask
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGContextDrawImage(context, rect, image.CGImage);
    
    // draw tint color, preserving alpha values of original image
    CGContextSetBlendMode(context, kCGBlendModeSourceIn);
    [tintColor setFill];
    CGContextFillRect(context, rect);
    
    UIImage *coloredImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return coloredImage;
}

@end

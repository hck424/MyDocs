//
//  Utility.m
//  MyDocs
//
//  Created by 김학철 on 2020/03/03.
//  Copyright © 2020 김학철. All rights reserved.
//

#import "Utility.h"
#import <ImageIO/ImageIO.h>

@implementation Utility
+ (UIImage *)imageFromColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end

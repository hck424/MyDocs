//
//  UIImage+Utility.h
//  MyDocs
//
//  Created by 김학철 on 2020/03/03.
//  Copyright © 2020 김학철. All rights reserved.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Utility)
- (UIImage *)imageWithTintColor:(UIColor *)tintColor;
+ (UIImage *)imageNamed:(NSString *)name withTintColor:(UIColor *)tintColor;
@end

NS_ASSUME_NONNULL_END

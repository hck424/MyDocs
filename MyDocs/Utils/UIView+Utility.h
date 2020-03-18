//
//  UIView+Utility.h
//  MyDocs
//
//  Created by 김학철 on 2020/03/04.
//  Copyright © 2020 김학철. All rights reserved.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Utility)
- (void)addSubview:(UIView *)view inset:(UIEdgeInsets)inset;
@end

NS_ASSUME_NONNULL_END

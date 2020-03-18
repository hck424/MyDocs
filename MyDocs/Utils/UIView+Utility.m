//
//  UIView+Utility.m
//  MyDocs
//
//  Created by 김학철 on 2020/03/04.
//  Copyright © 2020 김학철. All rights reserved.
//

#import "UIView+Utility.h"

@implementation UIView (Utility)
- (void)addSubview:(UIView *)view inset:(UIEdgeInsets)inset {
    [self addSubview:view];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [view.topAnchor constraintEqualToAnchor:self.topAnchor constant:inset.top].active = YES;
    [view.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:inset.left].active = YES;
    [view.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:inset.bottom].active = YES;
    [view.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:inset.right].active = YES;
}
@end

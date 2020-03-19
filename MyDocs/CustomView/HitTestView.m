//
//  HitTestView.m
//  MyDocs
//
//  Created by 김학철 on 2020/03/03.
//  Copyright © 2020 김학철. All rights reserved.
//

#import "HitTestView.h"

@implementation HitTestView

- (void)awakeFromNib {
    [super awakeFromNib];
}
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *hitView = [super hitTest:point withEvent:event];
    
    [self performSelector:@selector(actionNotification) withObject:nil afterDelay:0.0];
    return hitView;
}

- (void)actionNotification {
    [[NSNotificationCenter defaultCenter] postNotificationName:NotiNameHitTestView object:nil];
}

@end

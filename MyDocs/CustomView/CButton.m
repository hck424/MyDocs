//
//  CButton.m
//  Hanpass
//
//  Created by 김학철 on 14/11/2019.
//  Copyright © 2019 hanpass. All rights reserved.
//

#import "CButton.h"

@implementation CButton
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    if (_localizeText.length > 0) {
        [self setTitle:NSLocalizedString(_localizeText, @"") forState:UIControlStateNormal];
        [self setTitle:NSLocalizedString(_localizeText, @"") forState:UIControlStateHighlighted];
        [self setTitle:NSLocalizedString(_localizeText, @"") forState:UIControlStateSelected];
    }
    else {
        [self setTitle:@"" forState:UIControlStateNormal];
        [self setTitle:@"" forState:UIControlStateHighlighted];
        [self setTitle:@"" forState:UIControlStateSelected];
    }
    
    if (_borderWidth > 0 && _borderColor != nil) {
        self.layer.borderWidth = _borderWidth;
        self.layer.borderColor = _borderColor.CGColor;
    }

    if (_cornerRadius > 0) {
        self.clipsToBounds = YES;
        self.layer.cornerRadius = _cornerRadius;
    }
    
    if (_shadowColor != nil) {
        CAShapeLayer *subLayer = [[CAShapeLayer alloc] init];
        subLayer.path = [[UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.layer.cornerRadius] CGPath];
        subLayer.fillColor = [UIColor whiteColor].CGColor;
        self.layer.masksToBounds = NO;
        
        subLayer.shadowOffset = _shadowOffset;
        subLayer.shadowColor = _shadowColor.CGColor;
        subLayer.shadowRadius = _shadowRadius;
        subLayer.shadowOpacity = _shadowOpacity;
        [self.layer insertSublayer:subLayer atIndex:0];
    }
}

- (void)setLocalizeText:(NSString *)localizeText {
    _localizeText = localizeText;
    [self setNeedsDisplay];
}
- (void)setBorderColor:(UIColor *)borderColor {
    _borderColor = borderColor;
    [self setNeedsDisplay];
}
- (void)setBorderWidth:(CGFloat)borderWidth {
    _borderWidth = borderWidth;
    [self setNeedsDisplay];
}
- (void)setCornerRadius:(CGFloat)cornerRadius {
    _cornerRadius = cornerRadius;
    [self setNeedsDisplay];
}

//shadow
- (void)setShadowOffset:(CGSize)shadowOffset {
    _shadowOffset = shadowOffset;
    [self setNeedsDisplay];
}
- (void)setShadowColor:(UIColor *)shadowColor {
    _shadowColor = shadowColor;
    [self setNeedsDisplay];
}
- (void)setShadowRadius:(CGFloat)shadowRadius {
    _shadowRadius = shadowRadius;
    [self setNeedsDisplay];
}
- (void)setShadowOpacity:(CGFloat)shadowOpacity {
    _shadowOpacity = shadowOpacity;
    [self setNeedsDisplay];
}

@end

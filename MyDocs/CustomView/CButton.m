//
//  CButton.m
//  Hanpass
//
//  Created by 김학철 on 14/11/2019.
//  Copyright © 2019 hanpass. All rights reserved.
//

#import "CButton.h"
#import "Utility.h"
#import <QuartzCore/QuartzCore.h>
@interface CButton ()
@property (nonatomic, strong) CAShapeLayer *subLayer;
@property (nonatomic, strong) UIColor *bgColor;
@end
@implementation CButton
- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self decorationComponent];
}
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    [self decorationComponent];
}

- (void)decorationComponent {
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
            self.layer.masksToBounds = NO;
            
            if (_subLayer) {
                [_subLayer removeFromSuperlayer];
            }
            
            if ([self.backgroundColor isEqual:[UIColor clearColor]] == NO) {
                self.bgColor = self.backgroundColor;
            }
            self.layer.backgroundColor = [UIColor clearColor].CGColor;
            self.backgroundColor = [UIColor clearColor];
            
            self.subLayer = [[CAShapeLayer alloc] init];
            _subLayer.path = [[UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:_cornerRadius] CGPath];
            _subLayer.fillColor = _bgColor.CGColor;
            _subLayer.shadowOffset = _shadowOffset;
            _subLayer.shadowColor = _shadowColor.CGColor;
            _subLayer.shadowRadius = _shadowRadius;
            _subLayer.shadowOpacity = _shadowOpacity;
            
            [self.layer insertSublayer:_subLayer atIndex:0];
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

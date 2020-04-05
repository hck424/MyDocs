//
//  CView.m
//  Hanpass
//
//  Created by Hanpass on 2017. 12. 11..
//  Copyright © 2017년 hanpass. All rights reserved.
//

#import "CView.h"
@interface CView ()
@property (nonatomic, strong) CAShapeLayer *subLayer;
@property (nonatomic, strong) UIColor *bgColor;
@end
@implementation CView
- (void)awakeFromNib {
    [super awakeFromNib];
    [self decorationComponent];
}

- (id)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]){
        [self decorationComponent];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    [super drawRect:rect];
    [self decorationComponent];
}

- (void)decorationComponent {
    if (_borderWidth > 0 && _borderColor != nil) {
        self.layer.borderWidth = _borderWidth;
        self.layer.borderColor = _borderColor.CGColor;
    }
    
    if (_cornerRadius > 0) {
        self.clipsToBounds = YES;
        self.layer.cornerRadius = _cornerRadius;
    }
    
    if (_shadowColor != nil) {
//                 self.layer.masksToBounds = NO;
//                 self.layer.shadowOffset = _shadowOffset;
//                 self.layer.shadowColor = _shadowColor.CGColor;
//                 self.layer.shadowRadius = _shadowRadius;
//                 self.layer.shadowOpacity = _shadowOpacity;
//
//                 UIColor *backgroundCGColor = self.backgroundColor;
//                 self.backgroundColor = nil;
//                 self.layer.backgroundColor = backgroundCGColor.CGColor;
        
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
- (void)setBorderWidth:(CGFloat)borderWidth {
    _borderWidth = borderWidth;
    [self setNeedsDisplay];
}
- (void)setBorderColor:(UIColor *)borderColor {
    _borderColor = borderColor;
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

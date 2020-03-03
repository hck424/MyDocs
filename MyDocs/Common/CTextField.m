//
//  CTextField.m
//  Hanpass
//
//  Created by 김학철 on 29/09/2019.
//  Copyright © 2019 hanpass. All rights reserved.
//

#import "CTextField.h"
#import "Utility.h"

#define DEFAULT_BORDER_COLOR RGB(216, 216, 216)
#define DEFAULT_PLACE_HOLDER_COLOR   RGB(153, 153, 153)

@interface CTextField ()
@property (nonatomic, strong) CALayer *subLayer;
@end
@implementation CTextField


//- (void)awakeFromNib {
//    [super awakeFromNib];
//    [self updateUI];
//}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    [self updateUI];
}

- (void)updateUI {
    [self setAutocorrectionType:UITextAutocorrectionTypeNo];
    self.borderStyle = UITextBorderStyleNone;
    
    if (self.bgColor != nil) {
        self.background = [Utility imageFromColor:[UIColor whiteColor]];
//        self.backgroundColor = [UIColor whiteColor];
    }
    
    if (_borderBottom && _borderWidth > 0) {
        if (_subLayer) {
            [_subLayer removeFromSuperlayer];
        }
        self.subLayer = [CALayer layer];
        _subLayer.backgroundColor = _borderColor.CGColor;
        _subLayer.frame = CGRectMake(0, self.frame.size.height - _borderWidth, self.frame.size.width, _borderWidth);
        
        [self.layer addSublayer:_subLayer];
        self.layer.masksToBounds = YES;
    }
    else if (_borderAll && _borderWidth > 0) {
        self.layer.borderWidth = _borderWidth;
        self.layer.borderColor = _borderColor.CGColor;
    }
    
    if (_localizablePlaceHolder.length > 0) {
        NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(_localizablePlaceHolder, @"")];
        
        if (_colorPlaceHolder == nil) {
            _colorPlaceHolder = DEFAULT_PLACE_HOLDER_COLOR;
        }
        
        [attr addAttribute:NSForegroundColorAttributeName value:_colorPlaceHolder range:NSMakeRange(0, attr.string.length)];
        
        self.attributedPlaceholder = attr;
    }
    
    if (_cornerRaduis > 0) {
        self.layer.cornerRadius = _cornerRaduis;
        self.clipsToBounds = YES;
    }
}

//- (void)setBgColor:(UIColor *)bgColor {
//    _bgColor = bgColor;
//    [self setNeedsDisplay];
//}
//- (void)setInsetTop:(CGFloat)insetTop {
//    _insetTop = insetTop;
//    [self setNeedsDisplay];
//}
//- (void)setInsetLeft:(CGFloat)insetLeft {
//    _insetLeft = insetLeft;
//    [self setNeedsDisplay];
//}
//- (void)setInsetBottom:(CGFloat)insetBottom {
//    _insetBottom = insetBottom;
//    [self setNeedsDisplay];
//}
//- (void)setInsetRight:(CGFloat)insetRight {
//    _insetRight = insetRight;
//    [self setNeedsDisplay];
//}
//- (void)setLocalizablePlaceHolder:(NSString *)localizablePlaceHolder {
//    _localizablePlaceHolder = localizablePlaceHolder;
//    [self setNeedsDisplay];
//}
//- (void)setColorPlaceHolder:(UIColor *)colorPlaceHolder {
//    _colorPlaceHolder = colorPlaceHolder;
//    [self setNeedsDisplay];
//};
//
//- (void)setCornerRaduis:(CGFloat)cornerRaduis {
//    _cornerRaduis = cornerRaduis;
//    [self setNeedsDisplay];
//}
//- (void)setBorderBottom:(BOOL)borderBottom {
//    _borderBottom = borderBottom;
//    [self setNeedsDisplay];
//}
//- (void)setBorderAll:(BOOL)borderAll {
//    _borderAll = borderAll;
//    [self setNeedsDisplay];
//}
//
//- (void)setBorderWidth:(CGFloat)borderWidth {
//    _borderWidth = borderWidth;
//    [self setNeedsDisplay];
//}
//- (void)setBorderColor:(UIColor *)borderColor {
//    _borderColor = borderColor;
//    [self setNeedsDisplay];
//}

- (CGRect)textRectForBounds:(CGRect)bounds {
    return UIEdgeInsetsInsetRect(bounds, UIEdgeInsetsMake(_insetTop, _insetLeft, _insetBottom, _insetRight));
    
}
- (CGRect)editingRectForBounds:(CGRect)bounds {
    return UIEdgeInsetsInsetRect(bounds, UIEdgeInsetsMake(_insetTop, _insetLeft, _insetBottom, _insetRight));
}
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
//    if (action == @selector(paste:))
//        return NO;
//    return [super canPerformAction:action withSender:sender];
    return [super canPerformAction:action withSender:sender];
}

@end

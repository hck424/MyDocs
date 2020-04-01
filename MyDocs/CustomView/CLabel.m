//
//  CLabel.m
//  Hanpass
//
//  Created by Hanpass on 2017. 12. 8..
//  Copyright © 2017년 hanpass. All rights reserved.
//

#import "CLabel.h"

@interface CLabel ()

@end

@implementation CLabel

- (void)awakeFromNib {
    [super awakeFromNib];
    if (_localizedText.length > 0) {
        self.text = NSLocalizedString(_localizedText, @"");
    }
}
- (void)prepareForInterfaceBuilder {
    [super prepareForInterfaceBuilder];
}

- (void)setLocalizedText:(NSString *)localizedText {
    _localizedText = localizedText;
    [self setNeedsDisplay];
}

- (void)setLocalText:(NSString *)key {
    self.text = NSLocalizedString(key, @"");
}

- (void)setLocalUnderBarText:(NSString *)key {
    _localizedText = key;
    
    NSDictionary *underlineAttribute = @{NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle)};
    self.attributedText = [[NSAttributedString alloc] initWithString:NSLocalizedString(_localizedText, nil)
                                                          attributes:underlineAttribute];
}

- (void)drawTextInRect:(CGRect)rect {
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, UIEdgeInsetsMake(_insetTop, _insetLeft, _insetBottom, _insetRight))];
}

- (CGSize)intrinsicContentSize {
    CGSize size = [super intrinsicContentSize];
    size.width  += self.insetLeft + self.insetRight;
    size.height += self.insetTop + self.insetBottom;
    return size;
}

@end

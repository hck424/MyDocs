//
//  VerticalButton.m
//  JooSoN
//
//  Created by 학철 on 2018. 3. 11..
//  Copyright © 2018년 학철. All rights reserved.
//

#import "VerticalButton.h"
IB_DESIGNABLE
@implementation VerticalButton


- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.imageView.frame = CGRectMake((self.frame.size.width - _imgWidth)/2,
                                      MAX(self.contentEdgeInsets.top, self.imageEdgeInsets.top),
                                      _imgWidth,
                                      _imgHeight);
    
    self.titleLabel.frame = CGRectMake(self.titleEdgeInsets.left,
                                       MAX(self.contentEdgeInsets.top, self.imageEdgeInsets.top) + _imgHeight + _space,
                                       self.frame.size.width - self.titleEdgeInsets.left - self.titleEdgeInsets.right,
                                       self.titleLabel.frame.size.height);

    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    if (_localizeKey.length > 0) {
        [self setTitle:NSLocalizedString(_localizeKey, @"") forState:UIControlStateNormal];
    }
}
- (void)setImgWidth:(CGFloat)imgWidth {
    _imgWidth = imgWidth;
    [self setNeedsDisplay];
}
- (void)setImgHeight:(CGFloat)imgHeight {
    _imgHeight = imgHeight;
    [self setNeedsDisplay];
}
- (void)setSpace:(CGFloat)space {
    _space = space;
    [self setNeedsDisplay];
}
- (void)setLocalizeKey:(NSString *)localizeKey {
    _localizeKey = localizeKey;
    [self setNeedsDisplay];
}
- (void)setHidden:(BOOL)hidden {
    [super setHidden:hidden];
    [self setNeedsDisplay];
}
@end

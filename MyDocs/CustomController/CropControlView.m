//
//  CropControlView.m
//  MyDocs
//
//  Created by 김학철 on 2020/04/05.
//  Copyright © 2020 김학철. All rights reserved.
//

#import "CropControlView.h"
#import "AppDelegate.h"

#define WIDTH_BTN 40
#define DEFAULT_COLOR_BLUE RGB (0, 23, 255)

#define MIN_WIDTH_MIDDLE 15
#define MAX_WIDTH_MIDDLE 80

@interface CropControlView ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *arrBtn;
@property (weak, nonatomic) IBOutlet UIButton *btnMiddle;

@property (nonatomic, strong) NSMutableArray *arrPoint;
@property (nonatomic, strong) NSMutableArray *arrOriginPoint;
@property (nonatomic, strong) NSMutableArray *arrMiddlePoint;

@end
@implementation CropControlView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.arrBtn = [self.arrBtn sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"tag" ascending:YES]]];
    [self loadXib];
}
- (void)prepareForInterfaceBuilder {
    [super prepareForInterfaceBuilder];
}

- (void)loadXib {
    
    UIView *xib = [[NSBundle mainBundle] loadNibNamed:@"CropControlView" owner:self options:nil].firstObject;
    [self addSubview:xib];
    xib.translatesAutoresizingMaskIntoConstraints = NO;
    
    [xib.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:0].active = YES;
    [xib.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:0].active = YES;
    [xib.topAnchor constraintEqualToAnchor:self.topAnchor constant:0].active = YES;
    [xib.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:0].active = YES;
    
    
    for (UIButton *btn in _arrBtn) {
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
        [btn addGestureRecognizer:pan];
    }
    _btnMiddle.layer.borderColor = DEFAULT_COLOR_BLUE.CGColor;
    _btnMiddle.layer.borderWidth = 1.0;
}
- (void)setIsOnePage:(BOOL)isOnePage {
    _isOnePage = isOnePage;
    [self resetPoint];
}

- (void)resetPoint {
    
    UIEdgeInsets safeEdge = [[AppDelegate instance].window safeAreaInsets];
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    CGFloat posX = 0;
    CGFloat posY = 0;
    self.arrOriginPoint = [NSMutableArray array];
    self.arrPoint = [NSMutableArray array];
    
    for (NSInteger i = 0; i < 8; i++) {
        if (i == 0 || i == 6 || i == 7) {
            posX = safeEdge.left + WIDTH_BTN/2;
        }
        else if (i == 1 || i == 5) {
            posX = width/2;
        }
        else {
            posX = width - WIDTH_BTN/2 - safeEdge.right;
        }
        
        if (i == 0 || i == 1 || i == 2) {
            posY = safeEdge.top + WIDTH_BTN/2;
        }
        else if (i == 3 || i == 7) {
            posY = height / 2;
        }
        else {
            posY =  height -  WIDTH_BTN/2 - safeEdge.bottom;
        }
        
        CGPoint point = CGPointMake(posX, posY);
        [self.arrOriginPoint addObject:[NSValue valueWithCGPoint:point]];
    }
    
    [self.arrPoint setArray:_arrOriginPoint];
    
    
    for (NSInteger i = 0; i < _arrPoint.count; i++) {
        CGPoint point  = [[_arrPoint objectAtIndex:i] CGPointValue];
        UIButton *btn = [_arrBtn objectAtIndex:i];
        btn.frame = CGRectMake(0, 0, WIDTH_BTN, WIDTH_BTN);
        btn.center = point;
        
        if (_isOnePage) {
            if (i % 2 == 0) {
                btn.hidden = NO;
            }
            else {
                btn.hidden = YES;
            }
        }
        else {
            if (i % 2 == 0) {
                btn.hidden = YES;
            }
            else {
                btn.hidden = NO;
            }
        }
    }
    _btnMiddle.hidden = YES;
    if (_isOnePage == NO) {
        _btnMiddle.hidden = NO;
        CGPoint p1 = [[_arrPoint objectAtIndex:1] CGPointValue];
        CGPoint p5 = [[_arrPoint objectAtIndex:5] CGPointValue];
        
        CGFloat h = p5.y - p1.y;
        _btnMiddle.frame = CGRectMake(p1.x - MIN_WIDTH_MIDDLE/2, p1.y, MIN_WIDTH_MIDDLE, h);
    }
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGContextRef ctxt = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(ctxt, RGBA(0xdd, 0xdd, 0xdd, 0.5).CGColor);
    CGContextFillRect(ctxt, rect);
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    for (NSInteger i = 0; i < _arrPoint.count; i++) {
        CGPoint point = [[_arrPoint objectAtIndex:i] CGPointValue];
        if (i % 2 == 0) {
            if (i == 0) {
                CGPathMoveToPoint(path, NULL, point.x, point.y);
            }
            else {
                CGPathAddLineToPoint(path, NULL, point.x, point.y);
            }
        }
    }
    
    CGPoint point = [[_arrPoint firstObject] CGPointValue];
    CGPathAddLineToPoint(path, NULL, point.x, point.y);
    
    CGContextClosePath(ctxt);
    CGContextAddPath(ctxt, path);
    CGContextClip(ctxt);
    CGContextClearRect(ctxt, rect);
    CGContextSetFillColorWithColor(ctxt, [UIColor clearColor].CGColor);
    
    
    CGContextAddPath(ctxt, path);
    CGContextSetStrokeColorWithColor(ctxt, DEFAULT_COLOR_BLUE.CGColor);
    CGContextSetLineWidth(ctxt, 2.0);
    CGContextDrawPath(ctxt, kCGPathEOFillStroke);
}

- (void)panGesture:(UIPanGestureRecognizer *)gesture {
    
    CGPoint point = [gesture locationInView:self];
    if (gesture.state == UIGestureRecognizerStateBegan) {
        
    }
    else if (gesture.state == UIGestureRecognizerStateChanged) {
        UIButton *btn = (UIButton *)gesture.view;
        NSInteger idx = btn.tag;
        CGPoint newPoint = [self bounderayCheckPoint:point];
        btn.center = newPoint;
        
        
        [_arrPoint replaceObjectAtIndex:idx withObject:[NSValue valueWithCGPoint:newPoint]];
        
        [self setNeedsDisplay];
    }
    else if (gesture.state == UIGestureRecognizerStateEnded) {
        if ([self.delegate respondsToSelector:@selector(cropControl:arrPoint:arrPoint2:)]) {
            [_delegate cropControl:self arrPoint:_arrPoint arrPoint2:_arrPoint];
        }
    }
}

- (CGPoint)bounderayCheckPoint:(CGPoint)point {
    CGPoint newPoint = point;
    UIEdgeInsets safeEdge = [[AppDelegate instance].window safeAreaInsets];
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    if (newPoint.x < safeEdge.left + WIDTH_BTN/2) {
        newPoint.x = safeEdge.left + WIDTH_BTN/2;
    }
    else if (newPoint.x > width - WIDTH_BTN/2 - safeEdge.right) {
        newPoint.x = width - WIDTH_BTN/2 - safeEdge.right;
    }
    
    if (newPoint.y < safeEdge.top + WIDTH_BTN/2) {
        newPoint.y = safeEdge.top + WIDTH_BTN/2;
    }
    else if (newPoint.y > height -  WIDTH_BTN/2 - safeEdge.bottom) {
        newPoint.y = height -  WIDTH_BTN/2 - safeEdge.bottom;
    }
    return newPoint;
}
@end

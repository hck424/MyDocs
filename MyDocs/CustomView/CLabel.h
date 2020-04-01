//
//  CLabel.h
//  Hanpass
//
//  Created by Hanpass on 2017. 12. 8..
//  Copyright © 2017년 hanpass. All rights reserved.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE
@interface CLabel : UILabel
@property (nonatomic) IBInspectable NSString *localizedText;
@property (nonatomic) BOOL isNeedUnderBar;
@property (nonatomic, assign) IBInspectable CGFloat insetTop;
@property (nonatomic, assign) IBInspectable CGFloat insetLeft;
@property (nonatomic, assign) IBInspectable CGFloat insetBottom;
@property (nonatomic, assign) IBInspectable CGFloat insetRight;
- (void)setLocalText:(NSString *)key;
- (void)setLocalUnderBarText:(NSString *)key;

@end




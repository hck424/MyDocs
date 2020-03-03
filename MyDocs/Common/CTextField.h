//
//  CTextField.h
//  Hanpass
//
//  Created by 김학철 on 29/09/2019.
//  Copyright © 2019 hanpass. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTextField : UITextField
@property (nonatomic, assign) IBInspectable CGFloat insetTop;
@property (nonatomic, assign) IBInspectable CGFloat insetLeft;
@property (nonatomic, assign) IBInspectable CGFloat insetBottom;
@property (nonatomic, assign) IBInspectable CGFloat insetRight;

@property (nonatomic, strong) IBInspectable NSString *localizablePlaceHolder;
@property (nonatomic, strong) IBInspectable UIColor *colorPlaceHolder;
@property (nonatomic, strong) IBInspectable UIColor *bgColor;
@property (nonatomic, assign) IBInspectable CGFloat cornerRaduis;
@property (nonatomic, assign) IBInspectable BOOL borderBottom;
@property (nonatomic, assign) IBInspectable BOOL borderAll;
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
@property (nonatomic, strong) IBInspectable UIColor *borderColor;

@end


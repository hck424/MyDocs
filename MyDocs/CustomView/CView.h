//
//  CView.h
//  Hanpass
//
//  Created by Hanpass on 2017. 12. 11..
//  Copyright © 2017년 hanpass. All rights reserved.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE
@interface CView : UIView
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;
@property (nonatomic, strong) IBInspectable UIColor *borderColor;
@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;
@property (nonatomic, strong) IBInspectable UIColor *shadowColor;
@property (nonatomic, assign) IBInspectable CGSize shadowOffset;
@property (nonatomic, assign) IBInspectable CGFloat shadowRadius;
@property (nonatomic, assign) IBInspectable CGFloat shadowOpacity;

@end

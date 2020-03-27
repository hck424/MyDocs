//
//  CBarButtonItem.h
//  MyDocs
//
//  Created by 김학철 on 2020/03/04.
//  Copyright © 2020 김학철. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, TAG_NAVI_ITEM) {
    TAG_NAVI_ITEM_BACK = 1110,
};
@interface CBarButtonItem : UIBarButtonItem
@property (nonatomic, strong) UIColor  *naviBarTintColor;
@property (nonatomic, strong) UIColor *naviTintColor;
@property (nonatomic, strong) UIColor  *toolBarTintColor;
@property (nonatomic, strong) UIColor *toolTintColor;

+ (void)naviTitle:(UIViewController *)controller title:(NSString *)title isLeft:(BOOL)isLeft;
+ (void)naviBackBtn:(UIViewController *)controller action:(SEL)action;

+ (void)naviLeftBarButtons:(UIViewController *)controller images:(UIImage *)images tags:(NSArray *)tags action:(SEL)action;
+ (void)naviLeftBarButtons:(UIViewController *)controller titles:(NSString *)titles tags:(NSArray *)tags action:(SEL)action;

+ (void)naviRightBarButtons:(UIViewController *)controller imgName:(UIImage *)imgName tags:(NSArray *)tags action:(SEL)action;
+ (void)naviRightBarButtons:(UIViewController *)controller titles:(NSString *)titles tags:(NSArray *)tags action:(SEL)action;

+ (void)toolBarButtons:(UIViewController *)controller imgName:(UIImage *)imgName tags:(NSArray *)tags action:(SEL)action;
+ (void)toolBarButtons:(UIViewController *)controller titles:(NSString *)titles tags:(NSArray *)tags action:(SEL)action;

@end

//
//  CBarButtonItem.m
//  MyDocs
//
//  Created by 김학철 on 2020/03/04.
//  Copyright © 2020 김학철. All rights reserved.
//

#import "CBarButtonItem.h"
#import "Utility.h"
#import "UIImage+Utility.h"

#define TAG_LB_TITLE 1000
#define COLOR_BLUE RGB(28, 71, 178)
#define COLOR_WHITE RGB(255, 255, 255)

@implementation CBarButtonItem

+ (void)naviTitle:(UIViewController *)controller title:(NSString *)title isLeft:(BOOL)isLeft {
    controller.navigationController.navigationBarHidden = NO;
    
    UINavigationItem *navibarItem = controller.navigationItem;
    UINavigationBar *naviBar = controller.navigationController.navigationBar;
    
    naviBar.hidden = NO;
    naviBar.tintColor = COLOR_WHITE;

    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
    UILabel *lbTitle = [[UILabel alloc] initWithFrame:titleView.bounds];
    
    [titleView addSubview:lbTitle];
    
    lbTitle.attributedText = [[NSAttributedString alloc] initWithString:title attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:18.0 weight:UIFontWeightMedium], NSForegroundColorAttributeName : COLOR_WHITE}];
    
    lbTitle.tag = TAG_LB_TITLE;
    navibarItem.titleView = titleView;
    
    naviBar.translucent = NO;
    naviBar.barTintColor = COLOR_BLUE;
    
    [navibarItem setHidesBackButton:YES];
    if (isLeft) {
        lbTitle.frame = CGRectMake(-([UIScreen mainScreen].bounds.size.width - lbTitle.frame.size.width)/2 + 15,
                                   0,
                                   lbTitle.frame.size.width,
                                   lbTitle.frame.size.height);
    }
}

+ (UIBarButtonItem *)getBarButton:(UIViewController *)controller
                            image:(UIImage *)image
                            title:(NSString *)title
                       titleColor:(UIColor *)titleColor
                     contentInset:(UIEdgeInsets)contentInset
                       titleInset:(UIEdgeInsets)titleInset
                        aligement:(NSTextAlignment)aligement
                              tag:(NSUInteger)tag
                           action:(SEL)action {
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.tag = tag;
    if (aligement == NSTextAlignmentLeft) {
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    }
    else if (aligement == NSTextAlignmentRight) {
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    }
    else {
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }
    
    if (title.length > 0) {
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:titleColor forState:UIControlStateNormal];
    }
    
    btn.contentEdgeInsets = contentInset;
    btn.titleEdgeInsets = titleInset;
    
    CGFloat width = [btn.titleLabel sizeThatFits:CGSizeMake(CGFLOAT_MAX, 44)].width + contentInset.left + contentInset.right + titleInset.left + titleInset.right;
    width = (width < 44)? 44 : width;
    btn.frame = CGRectMake(0, 0, width, 44);
    
    [btn setImage:image forState:UIControlStateNormal];
    [btn addTarget:controller action:action forControlEvents:UIControlEventTouchUpInside];
    

    UIBarButtonItem *barbtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    return barbtn;
}

//+ (void)naviBackBtn:(UIViewController *)controller action:(SEL)action {
//
//    UIImage *imgNor = [[UIImage imageNamed:@"back"] imageWithTintColor:COLOR_WHITE];
//    UIColor *titleColor = COLOR_WHITE;
//    UIBarButtonItem *barbtn = [CBarButtonItem getBarButton:controller
//                                                     image:imgNor
//                                                     title:nil
//                                                titleColor:titleColor
//                                              contentInset:UIEdgeInsetsZero
//                                                titleInset:UIEdgeInsetsZero
//                                                 aligement:NSTextAlignmentLeft
//                                                       tag:100 action:action];
//
//    [controller.navigationItem setHidesBackButton:YES];
//    [controller.navigationItem setLeftBarButtonItem:barbtn];
//
//    UIView *titleView = [controller.navigationItem.titleView viewWithTag:TAG_LB_TITLE];
//    titleView.frame = CGRectMake(CGRectGetMinX(titleView.frame) + 22,
//                                 titleView.frame.origin.y,
//                                 titleView.frame.size.width,
//                                 titleView.frame.size.height);
//
//    UIButton *btn = (UIButton *)[controller.navigationItem.leftBarButtonItem.customView viewWithTag:100];
//    return btn;
//}

+ (void)naviBackBtn:(UIViewController *)controller action:(SEL)action {
    controller.navigationController.navigationItem.hidesBackButton = NO;
    controller.navigationController.navigationItem.leftItemsSupplementBackButton = NO;
}

+ (void)naviLeftBarButtons:(UIViewController *)controller images:(NSArray *)images tags:(NSArray *)tags action:(SEL)action {
    controller.navigationController.navigationBar.tintColor = COLOR_WHITE;
    controller.navigationController.navigationBar.barTintColor = COLOR_BLUE;
    
    for (UIImage *img in images) {
        
    }
}
+ (void)naviLeftBarButtons:(UIViewController *)controller titles:(NSString *)titles tags:(NSArray *)tags action:(SEL)action {
    
}

+ (void)naviRightBarButtons:(UIViewController *)controller imgName:(UIImage *)imgName tags:(NSArray *)tags action:(SEL)action {
    
}
+ (void)naviRightBarButtons:(UIViewController *)controller titles:(NSString *)titles tags:(NSArray *)tags action:(SEL)action {
    
}

+ (void)toolBarButtons:(UIViewController *)controller imgName:(UIImage *)imgName tags:(NSArray *)tags action:(SEL)action {
    
}
+ (void)toolBarButtons:(UIViewController *)controller titles:(NSString *)titles tags:(NSArray *)tags action:(SEL)action {
    
}

//+ (UIButton *)addNaviRightBtn:(UIViewController *)controller
//                      imgName:(NSString *)imgName
//                        title:(NSString *)title
//                       action:(SEL)action {
//
//    UIImage *img = nil;
//    if (imgName.length > 0) {
//        img = [UIImage imageNamed:imgName];
//    }
//
//    NSUInteger tag = (controller.navigationItem.rightBarButtonItems.count + 200);
//    UIColor *titleColor = COLOR_WHITE;
//    UIBarButtonItem *barbtn = [CBarButtonItem getBarButton:controller
//                                                     image:img
//                                                     title:title titleColor:titleColor
//                                              contentInset:UIEdgeInsetsZero
//                                                titleInset:UIEdgeInsetsZero
//                                                 aligement:NSTextAlignmentRight
//                                                       tag:tag
//                                                    action:action];
//
//    [controller.navigationItem setHidesBackButton:YES];
//
//    NSMutableArray *arrBarBtn = [NSMutableArray array];
//    if ([controller.navigationItem.rightBarButtonItems count] > 0) {
//        [arrBarBtn setArray:controller.navigationItem.rightBarButtonItems];
//        [arrBarBtn addObject:barbtn];
//        controller.navigationItem.rightBarButtonItems = arrBarBtn;
//    }
//    else {
//        [arrBarBtn addObject:barbtn];
//        controller.navigationItem.rightBarButtonItems = arrBarBtn;
//
//        UIView *titleView = [controller.navigationItem.titleView viewWithTag:TAG_LB_TITLE];
//        titleView.frame = CGRectMake(CGRectGetMinX(titleView.frame) + 22,
//                                     titleView.frame.origin.y,
//                                     titleView.frame.size.width,
//                                     titleView.frame.size.height);
//
//    }
//
//    UIButton *btn = [[[controller.navigationItem.rightBarButtonItems lastObject] customView] viewWithTag:tag];
//    return btn;
//}
//
//
//+ (NSArray <UIButton *> *)addToolBarItems:(UIViewController *)controller imgNames:(NSArray *)imgNames titles:(NSArray *)titles action:(SEL)action {
//
//    controller.navigationController.toolbarHidden = NO;
//
//    NSInteger maxCount = imgNames.count;
//    maxCount = maxCount > titles.count ? maxCount : titles.count;
//    UIColor *titleColor = COLOR_BLUE;
//
//    NSMutableArray *arrBar = [NSMutableArray array];
//    NSArray
//    for (NSInteger i = 0; i < maxCount; i++) {
//        NSString *imgName = [imgNames objectAtIndex:i];
//        NSString *title = [titles objectAtIndex:i];
//        UIImage *img = imgName.length > 0 ? [UIImage imageNamed:imgName] : nil;
//
//        UIBarButtonItem *bar = [CBarButtonItem getBarButton:controller image:img
//                                                      title:title
//                                                 titleColor:titleColor
//                                               contentInset:UIEdgeInsetsMake(10, 10, 10, 10)
//                                                 titleInset:UIEdgeInsetsZero
//                                                  aligement:NSTextAlignmentCenter tag:300+i action:action];
//        [arrBar addObject:bar];
//        if (i < maxCount -1) {
//            UIBarButtonItem *flableBar = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
//            [arrBar addObject:flableBar];
//        }
//    }
//
//    controller.navigationController.toolbar.barTintColor = COLOR_WHITE;
//    controller.toolbarItems = arrBar;
//
//}
@end

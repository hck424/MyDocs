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

+ (void)naviTitle:(UIViewController *)controller title:(NSString *)title {
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

+ (void)naviBackBtn:(UIViewController *)controller action:(SEL)action {
    controller.navigationController.navigationItem.hidesBackButton = NO;
    controller.navigationController.navigationItem.leftItemsSupplementBackButton = NO;
    controller.navigationController.navigationBar.tintColor = COLOR_WHITE;
    controller.navigationController.navigationBar.barTintColor = COLOR_BLUE;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.tintColor = [UIColor whiteColor];
    [btn setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateNormal];
    [btn setTitle:@"Back" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:17.0 weight:UIFontWeightSemibold];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.tag = TAG_NAVI_ITEM_BACK;
    [btn addTarget:controller action:action forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *barBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    controller.navigationItem.leftBarButtonItem = barBtn;
}

+ (void)naviRightBarButtons:(UIViewController *)controller imgName:(UIImage *)imgName tags:(NSArray *)tags action:(SEL)action {
    
}
+ (void)naviRightBarButtons:(UIViewController *)controller titles:(NSString *)titles tags:(NSArray *)tags action:(SEL)action {
    
}

+ (void)toolBarButtons:(UIViewController *)controller imgName:(UIImage *)imgName tags:(NSArray *)tags action:(SEL)action {
    
}
+ (void)toolBarButtons:(UIViewController *)controller titles:(NSString *)titles tags:(NSArray *)tags action:(SEL)action {
    
}

@end

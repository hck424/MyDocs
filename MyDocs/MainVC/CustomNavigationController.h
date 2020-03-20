//
//  CustomNavigationController.h
//  MyDocs
//
//  Created by 김학철 on 2020/03/19.
//  Copyright © 2020 김학철. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "UIViewController+LGSideMenuController.h"
#import "LeftTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface CustomNavigationController : UINavigationController

- (void)changeRootViewController:(NSString *)rootId;
@end

NS_ASSUME_NONNULL_END

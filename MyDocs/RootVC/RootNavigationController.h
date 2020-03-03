//
//  RootNavigationController.h
//  MyFiles
//
//  Created by 김학철 on 2020/01/22.
//  Copyright © 2020 김학철. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "UIViewController+LGSideMenuController.h"
#import "LeftTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface RootNavigationController : UINavigationController
- (void)changeRootViewController;
@end

NS_ASSUME_NONNULL_END

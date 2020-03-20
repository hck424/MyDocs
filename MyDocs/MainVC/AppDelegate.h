//
//  AppDelegate.h
//  MyDocs
//
//  Created by 김학철 on 2020/03/03.
//  Copyright © 2020 김학철. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootNavigationController.h"
#import "NSBundle+Language.h"
#import "MainViewController.h"
#import "TutorialViewController.h"
#import "CustomNavigationController.h"
#import "ToolBarViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow * window;
@property (nonatomic, strong) MainViewController *mainViewController;
@property (nonatomic, strong) CustomNavigationController *customNavigationController;
@property (nonatomic, strong) ToolBarViewController *toolBarViewController;
+ (AppDelegate *)instance;

- (RootNavigationController *)rootNavigationController;
- (void)callTutorialViewController;
- (void)callMainViewController;
@end


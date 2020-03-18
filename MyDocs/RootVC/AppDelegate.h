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

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow * window;
+ (AppDelegate *)instance;
- (RootNavigationController *)rootNavigationController;
- (void)callTutorialViewController;
- (void)callMainViewController;
@end


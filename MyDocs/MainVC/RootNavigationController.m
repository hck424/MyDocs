//
//  RootNavigationController.m
//  MyFiles
//
//  Created by 김학철 on 2020/01/22.
//  Copyright © 2020 김학철. All rights reserved.
//

#import "RootNavigationController.h"

@interface RootNavigationController ()


@end

@implementation RootNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (@available(iOS 13, *)) {
        [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    }
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (@available (iOS 13.0, *)) {
        UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
        [appearance configureWithOpaqueBackground];
        appearance.backgroundColor = COLOR_APP_DEFAULT;
        appearance.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
        
        UIBarButtonItemAppearance *buttonAppearance = [[UIBarButtonItemAppearance alloc] init];
        buttonAppearance.normal.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
        appearance.buttonAppearance = buttonAppearance;
        
        UINavigationBar.appearance.standardAppearance = appearance;
        UINavigationBar.appearance.scrollEdgeAppearance = appearance;
        UINavigationBar.appearance.compactAppearance = appearance;
    }
    else {
        UINavigationBar.appearance.barTintColor = COLOR_APP_DEFAULT;
        UINavigationBar.appearance.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
        UINavigationBar.appearance.tintColor = [UIColor whiteColor];
        UIBarButtonItem.appearance.tintColor = [UIColor whiteColor];
    }
}
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
@end

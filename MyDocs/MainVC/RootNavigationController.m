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
    self.navigationBar.tintColor = [UIColor whiteColor];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end

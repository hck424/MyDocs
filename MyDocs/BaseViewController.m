//
//  BaseViewController.m
//  MyFiles
//
//  Created by 김학철 on 2020/01/22.
//  Copyright © 2020 김학철. All rights reserved.
//

#import "BaseViewController.h"
#import "AppDelegate.h"
#import "CBarButtonItem.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    if([self.navigationController.navigationBar respondsToSelector:@selector(barTintColor)]) {
        self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    }
    else {
        [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    }
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notiHitViewAction:) name:NotiNameHitTestView object:nil];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NotiNameHitTestView object:nil];
}

#pragma mark - notification hittestview
- (void)notiHitViewAction:(NSNotification *)notification {
    [self.view endEditing:YES];
}
@end

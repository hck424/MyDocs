//
//  RootNavigationController.m
//  MyFiles
//
//  Created by 김학철 on 2020/01/22.
//  Copyright © 2020 김학철. All rights reserved.
//

#import "RootNavigationController.h"
#import "HomeViewController.h"
#import "iCloudViewController.h"
#import "GoogleDriveViewController.h"
#import "DropBoxViewController.h"
#import "OneDriveViewController.h"

@interface RootNavigationController () <UINavigationControllerDelegate>
@property (nonatomic, strong) NSString *curRootId;

@end

@implementation RootNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    
    self.navigationBar.tintColor = [UIColor whiteColor];
    
//    [self changeRootViewController];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
- (void)changeRootViewController {
    NSString *selRootId = [[NSUserDefaults standardUserDefaults] objectForKey:SelectedRootId];
    
    if (selRootId.length > 0 && [_curRootId isEqualToString:selRootId]) {
        return;
    }
    
    _curRootId = selRootId;
    UIViewController *viewCtrl = nil;
    if ([_curRootId isEqualToString:RootIdiCloud]) {
        iCloudViewController *vc = [[UIStoryboard storyboardWithName:@"iCloude" bundle:nil] instantiateViewControllerWithIdentifier:@"iCloudViewController"];
        viewCtrl = vc;
    }
    else if ([_curRootId isEqualToString:RootIdiDropBox]) {
        DropBoxViewController *vc = [[UIStoryboard storyboardWithName:@"DropBox" bundle:nil] instantiateViewControllerWithIdentifier:@"DropBoxViewController"];
        viewCtrl = vc;
    }
    else if ([_curRootId isEqualToString:RootIdGoogle]) {
        GoogleDriveViewController *vc = [[UIStoryboard storyboardWithName:@"GoogleDrive" bundle:nil] instantiateViewControllerWithIdentifier:@"GoogleDriveViewController"];
        viewCtrl = vc;
    }
    else if ([_curRootId isEqualToString:RootIdiOneDrive]) {
        OneDriveViewController *vc = [[UIStoryboard storyboardWithName:@"OneDrive" bundle:nil] instantiateViewControllerWithIdentifier:@"OneDriveViewController"];
        viewCtrl = vc;
    }
    else {
        HomeViewController *vc = [[UIStoryboard storyboardWithName:@"Home" bundle:nil] instantiateViewControllerWithIdentifier:@"HomeViewController"];
        viewCtrl = vc;
    }
    
    if (viewCtrl != nil) {
        viewCtrl.navigationItem.leftBarButtonItem = [self getMenuNaviBar];
        [self pushViewController:viewCtrl animated:NO];
    }
}

- (UIBarButtonItem *)getMenuNaviBar {
    
    UIBarButtonItem *navibar = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStyleBordered target:self action:@selector(onClickedMenuAction:)];
    navibar.tintColor = [UIColor whiteColor];
    navibar.accessibilityValue = @"Menu";
    return navibar;
}

- (void)onClickedMenuAction:(UIBarButtonItem *)sender {
    if ([sender.accessibilityValue isEqualToString:@"Menu"]) {
        MainViewController *mainViewController = (MainViewController *)self.sideMenuController;
        [mainViewController showLeftViewAnimated:YES completionHandler:nil];
     
        if ([mainViewController.leftViewController respondsToSelector:@selector(reloadData)]) {
            [mainViewController.leftViewController performSelector:@selector(reloadData)];
        }
    }
}

#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
//    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
//    viewController.navigationItem.backBarButtonItem = item;
    
}
@end

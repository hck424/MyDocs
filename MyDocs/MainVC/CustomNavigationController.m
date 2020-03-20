//
//  CustomNavigationController.m
//  MyDocs
//
//  Created by 김학철 on 2020/03/19.
//  Copyright © 2020 김학철. All rights reserved.
//

#import "CustomNavigationController.h"
#import "HomeViewController.h"
#import "iCloudViewController.h"
#import "GoogleDriveViewController.h"
#import "DropBoxViewController.h"
#import "OneDriveViewController.h"

@interface CustomNavigationController ()
@property (nonatomic, strong) NSString *curRootId;
@end

@implementation CustomNavigationController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.tintColor = [UIColor whiteColor];
    [self setRootViewController];
}
- (void)willMoveToParentViewController:(UIViewController *)parent {
    [super willMoveToParentViewController:parent];
}
- (void)didMoveToParentViewController:(UIViewController *)parent {
    [super didMoveToParentViewController:parent];
}

- (void)changeRootViewController:(NSString *)rootId {
    self.curRootId = rootId;
    [self setRootViewController];
}

- (void)setRootViewController {
    
    NSString *selRootId = [[NSUserDefaults standardUserDefaults] objectForKey:SelectedRootId];
    
    if (selRootId.length > 0 && [_curRootId isEqualToString:selRootId]) {
        return;
    }
    
    UIViewController *viewCtrl = nil;
    if ([_curRootId isEqualToString:RootIdiCloud]) {
        iCloudViewController *vc = [[UIStoryboard storyboardWithName:@"iCloud" bundle:nil] instantiateViewControllerWithIdentifier:@"iCloudViewController"];
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
        self.curRootId = RootIdHome;
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:_curRootId forKey:SelectedRootId];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    if (viewCtrl != nil) {
        viewCtrl.navigationItem.leftBarButtonItem = [self getMenuNaviBar];
        [self setViewControllers:@[viewCtrl] animated:NO];
    }
}

- (UIBarButtonItem *)getMenuNaviBar {
    UIBarButtonItem *navibar = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStylePlain target:self action:@selector(onClickedMenuAction:)];
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

@end

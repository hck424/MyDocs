//
//  BaseViewController.m
//  MyFiles
//
//  Created by 김학철 on 2020/01/22.
//  Copyright © 2020 김학철. All rights reserved.
//

#import "BaseViewController.h"
#import "AppDelegate.h"
@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    if (_showSearchBar) {
        NSArray *arr = [self.view constraints];
        for (NSLayoutConstraint *constraint in arr) {
            if ([constraint.identifier isEqualToString:@"CT"]) {
                constraint.constant = _searchBar.frame.size.height;
            }
        }
    }
    
    if (_showToolBar) {
        NSArray *arr = [self.view constraints];
        for (NSLayoutConstraint *constraint in arr) {
            if ([constraint.identifier isEqualToString:@"CB"]) {
                constraint.constant = _toolBar.frame.size.height;
            }
        }
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notiHitViewAction:) name:NotiNameHitTestView object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NotiNameHitTestView object:nil];
}

- (void)setShowSearchBar:(BOOL)showSearchBar {
    _showSearchBar = showSearchBar;
    if (_showSearchBar) {
        self.searchBar = [[NSBundle mainBundle] loadNibNamed:@"SearchBar" owner:self options:nil].firstObject;
        [self.view addSubview:_searchBar];
        _searchBar.translatesAutoresizingMaskIntoConstraints = NO;
        
        UIEdgeInsets safeInset = [[AppDelegate instance].window safeAreaInsets];
        CGFloat top = safeInset.top;
        if (self.navigationController.navigationBarHidden == NO) {
            top += self.navigationController.navigationBar.frame.size.height;
            [_searchBar.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:top].active = YES;
        }
        else {
            [_searchBar.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:top].active = YES;
        }
        
        [_searchBar.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:0].active = YES;
        [_searchBar.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:0].active = YES;
        [_searchBar.heightAnchor constraintEqualToConstant:_searchBar.frame.size.height].active = YES;
    }
    else {
        if (_searchBar) {
            [_searchBar removeFromSuperview];
        }
    }
//    [self.view layoutIfNeeded];
}

- (void)setShowToolBar:(BOOL)showToolBar {
    _showToolBar = showToolBar;
    
    if (_showToolBar) {
        self.toolBar = [[NSBundle mainBundle] loadNibNamed:@"CToolBar" owner:self options:nil].firstObject;
        [self.view addSubview:_toolBar];
        _toolBar.translatesAutoresizingMaskIntoConstraints = NO;
        
        [_toolBar.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:0].active = YES;
        [_toolBar.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:0].active = YES;
        [_toolBar.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:0].active = YES;
    }
    else {
        if (_toolBar) {
            [_toolBar removeFromSuperview];
        }
    }
    [self.view layoutIfNeeded];
}

#pragma mark - notification hittestview
- (void)notiHitViewAction:(NSNotification *)notification {
    [self.view endEditing:YES];
}
@end

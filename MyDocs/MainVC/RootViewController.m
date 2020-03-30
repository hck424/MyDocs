//
//  RootViewController.m
//  MyDocs
//
//  Created by 김학철 on 2020/03/19.
//  Copyright © 2020 김학철. All rights reserved.
//

#import "RootViewController.h"
#import "AppDelegate.h"

@interface RootViewController ()
@property (weak, nonatomic) IBOutlet UIView *containerCoustomNavi;
@property (weak, nonatomic) IBOutlet UIView *containerAd;
@property (weak, nonatomic) IBOutlet UIView *containerToolBar;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightToolBar;

@end

@implementation RootViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    if ([[AppDelegate instance].window safeAreaInsets].bottom > 0) {
        _heightToolBar.constant = 78.0;
    }
    else {
        _heightToolBar.constant = 44.0;
    }
    self.hasAd = NO;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
}

- (void)setHasAd:(BOOL)hasAd {
    _hasAd = hasAd;
    if (_hasAd) {
        _containerAd.hidden = NO;
    }
    else {
        _containerAd.hidden = YES;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"custom"]) {
        [AppDelegate instance].customNavigationController = segue.destinationViewController;
    }
    else if ([segue.identifier isEqualToString:@"advertise"]) {
        
    }
    else if ([segue.identifier isEqualToString:@"toolbar"]) {
        [AppDelegate instance].toolBarViewController = segue.destinationViewController;
    }
}
@end

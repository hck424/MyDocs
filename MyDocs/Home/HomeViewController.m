//
//  HomeViewController.m
//  MyFiles
//
//  Created by 김학철 on 2020/01/22.
//  Copyright © 2020 김학철. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UIView *topView;

@end

@implementation HomeViewController
@synthesize topView = _topView;
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.title = NSLocalizedString(@"home", @"");
    
    
}

//- (IBAction)onClickedButtonAction:(id)sender {
//    if (sender == _btnMenu) {
//        [self onClickMenuAction];
//    }
//
//}

@end

//
//  GoogleDriveViewController.m
//  MyFiles
//
//  Created by 김학철 on 2020/01/22.
//  Copyright © 2020 김학철. All rights reserved.
//

#import "GoogleDriveViewController.h"

@interface GoogleDriveViewController ()

@end

@implementation GoogleDriveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.title = NSLocalizedString(@"google_drive", @"");
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

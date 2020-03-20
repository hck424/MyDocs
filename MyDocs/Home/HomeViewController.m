//
//  HomeViewController.m
//  MyFiles
//
//  Created by 김학철 on 2020/01/22.
//  Copyright © 2020 김학철. All rights reserved.
//

#import "HomeViewController.h"
#import "UIView+Utility.h"
#import "FCFileManager.h"
#import "FileListController.h"

@interface HomeViewController () <SearchBarDelegate>

@property (nonatomic, strong) FileListController *fileListVc;
@end

@implementation HomeViewController
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.title = NSLocalizedString(@"home", @"");
    
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
 
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *destinateVC = segue.destinationViewController;
    if ([destinateVC isKindOfClass:[FileListController class]]) {
        self.fileListVc = (FileListController *)destinateVC;
        _fileListVc.rootPath = @"home";
        _fileListVc.listType = LIST_TYPE_TABLE;
    }
}

@end

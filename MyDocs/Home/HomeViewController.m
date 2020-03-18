//
//  HomeViewController.m
//  MyFiles
//
//  Created by 김학철 on 2020/01/22.
//  Copyright © 2020 김학철. All rights reserved.
//

#import "HomeViewController.h"
#import "UIView+Utility.h"
#import "PathViewController.h"

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIButton *btnTest;

@end

@implementation HomeViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.showSearchBar = YES;
    self.showToolBar = YES;
    self.toolBar.type = ToolBarTypeDefault;
    [self.toolBar addTouchUpInsideAction:self selector:@selector(onClickedButtonAction:)];
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

- (IBAction)onClickedButtonAction:(UIButton *)sender {
    if (sender == _btnTest) {
        PathViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"PathViewController"];
        [self.navigationController pushViewController:vc animated:NO];
    }
    else if (sender.tag == TAG_TOOL_BTN_SELECT) {
        sender.selected = !sender.selected;
        if (sender.selected) {
            self.toolBar.type = ToolBarTypeDelete;
        }
        else {
            self.toolBar.type = ToolBarTypeDefault;
        }
    }
    else if (sender.tag == TAG_TOOL_BTN_SORT) {
        
    }
    else if (sender.tag == TAG_TOOL_BTN_DELETE) {
        
    }
    else if (sender.tag == TAG_TOOL_BTN_NEWFOLDER) {
        
    }
    else if (sender.tag == TAG_TOOL_BTN_ADDFILES) {
        
    }
}

@end

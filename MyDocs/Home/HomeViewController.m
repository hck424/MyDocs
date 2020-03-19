//
//  HomeViewController.m
//  MyFiles
//
//  Created by 김학철 on 2020/01/22.
//  Copyright © 2020 김학철. All rights reserved.
//

#import "HomeViewController.h"
#import "UIView+Utility.h"
#import "FilePathViewController.h"
#import "FCFileManager.h"
#import "FileListController.h"

@interface HomeViewController () <SearchBarDelegate>

@property (nonatomic, strong) FileListController *fileListVc;
@end

@implementation HomeViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.showSearchBar = YES;
    self.searchBar.delegate = self;
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
    if (sender.tag == TAG_TOOL_BTN_SELECT) {
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UIViewController *destinateVC = segue.destinationViewController;
    if ([destinateVC isKindOfClass:[FileListController class]]) {
        self.fileListVc = (FileListController *)destinateVC;
        _fileListVc.rootPath = self.title;
        _fileListVc.listType = LIST_TYPE_TABLE;
    }
}

#pragma mark - SearchBarDelegate
- (void)searchBar:(id)searchBar editingChangedString:(NSString *)text {
    NSLog(@"%@", text);
    _fileListVc.searchString = text;
}
- (BOOL)searchBar:(id)searchBar textFieldShouldReturn:(UITextField *)textFiled {
    if (textFiled.text.length > 0) {
        [self.view endEditing:YES];
        return YES;
    }
    return NO;
}
- (void)searchBar:(id)searchBar changedListType:(LIST_TYPE)listType {
    _fileListVc.listType = listType;
}

@end

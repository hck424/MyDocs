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
//- (IBAction)onClickedButtonAction:(UIButton *)sender {
//    if (sender.tag == TAG_TOOL_BTN_SELECT) {
////        sender.selected = !sender.selected;
////        if (sender.selected) {
////            self.toolBar.type = ToolBarTypeDelete;
////        }
////        else {
////            self.toolBar.type = ToolBarTypeDefault;
////        }
//    }
//    else if (sender.tag == TAG_TOOL_BTN_SORT) {
//
//    }
//    else if (sender.tag == TAG_TOOL_BTN_DELETE) {
//
//    }
//    else if (sender.tag == TAG_TOOL_BTN_NEWFOLDER) {
//
//    }
//    else if (sender.tag == TAG_TOOL_BTN_ADDFILES) {
//
//    }
//}
//
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//
//}
//
//#pragma mark - SearchBarDelegate
//- (void)searchBar:(id)searchBar editingChangedString:(NSString *)text {
//    NSLog(@"%@", text);
////    _fileListVc.searchString = text;
//}
//- (BOOL)searchBar:(id)searchBar textFieldShouldReturn:(UITextField *)textFiled {
//    if (textFiled.text.length > 0) {
//        [self.view endEditing:YES];
//        return YES;
//    }
//    return NO;
//}
//- (void)searchBar:(id)searchBar changedListType:(LIST_TYPE)listType {
////    _fileListVc.listType = listType;
//}

@end

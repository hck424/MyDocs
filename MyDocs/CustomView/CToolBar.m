//
//  CToolBar.m
//  MyDocs
//
//  Created by 김학철 on 2020/03/18.
//  Copyright © 2020 김학철. All rights reserved.
//

#import "CToolBar.h"
#import "AppDelegate.h"

@implementation CToolBar
- (void)awakeFromNib {
    [super awakeFromNib];
    UIEdgeInsets safeInset = [[AppDelegate instance].window safeAreaInsets];
    if (safeInset.bottom > 0) {
        _saftyView.hidden = NO;
    }
    else {
        _saftyView.hidden = YES;
    }
    
    [self.heightAnchor constraintEqualToConstant:safeInset.bottom + 44].active = YES;
    
    self.btnSelect.tag = TAG_TOOL_BTN_SELECT;
    self.btnSort.tag = TAG_TOOL_BTN_SORT;
    self.btnNewFolder.tag = TAG_TOOL_BTN_NEWFOLDER;
    self.btnDelete.tag = TAG_TOOL_BTN_ADDFILES;
    self.btnAddFile.tag = TAG_TOOL_BTN_DELETE;
}

- (void)setType:(ToolBarType)type {
    _type = type;
    
    self.btnSelect.hidden = NO;
    self.btnSort.hidden = NO;
    self.btnNewFolder.hidden = NO;
    self.btnDelete.hidden = NO;
    self.btnAddFile.hidden = NO;

    if (_type == ToolBarTypeDefault) {
        _btnDelete.hidden = YES;
    }
    else if (_type == ToolBarTypeDelete) {
        _btnSort.hidden = YES;
    }
}

- (void)addTouchUpInsideAction:(id)controller selector:(SEL)selector {
    for (UIButton *btn in _svContainer.subviews) {
        [btn addTarget:controller action:selector forControlEvents:UIControlEventTouchUpInside];
    }
}
@end

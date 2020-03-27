//
//  ToolBarViewController.m
//  MyDocs
//
//  Created by 김학철 on 2020/03/19.
//  Copyright © 2020 김학철. All rights reserved.
//

#import "ToolBarViewController.h"

@interface ToolBarViewController ()

@property (weak, nonatomic) IBOutlet UIStackView *svContent;
@property (weak, nonatomic) IBOutlet VerticalButton *btnSelect;
@property (weak, nonatomic) IBOutlet VerticalButton *btnRemove;
@property (weak, nonatomic) IBOutlet VerticalButton *btnSort;
@property (weak, nonatomic) IBOutlet VerticalButton *btnNewFolder;
@property (weak, nonatomic) IBOutlet VerticalButton *btnAddFile;

@end

@implementation ToolBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.btnSelect.tag = TAG_TOOL_BTN_SELECT;
    self.btnRemove.tag = TAG_TOOL_BTN_DELETE;
    self.btnSort.tag = TAG_TOOL_BTN_SORT;
    self.btnNewFolder.tag = TAG_TOOL_BTN_NEWFOLDER;
    self.btnAddFile.tag = TAG_TOOL_BTN_DELETE;
}

- (IBAction)onClickedButtonAction:(UIButton *)sender {
}
- (void)setType:(ToolBarType)type {
    _type = type;
    
    self.btnSelect.hidden = NO;
    self.btnSort.hidden = NO;
    self.btnNewFolder.hidden = NO;
    self.btnRemove.hidden = NO;
    self.btnAddFile.hidden = NO;
    
    if (_type == ToolBarTypeDefault) {
        _btnRemove.hidden = YES;
    }
    else if (_type == ToolBarTypeDelete) {
        _btnSort.hidden = YES;
    }
}
- (void)removeUpInsideAction:(id)controller selector:(SEL)selector {
    for (UIButton *btn in _svContent.subviews) {
        [btn removeTarget:controller action:selector forControlEvents:UIControlEventTouchUpInside];
    }
}
- (void)addTouchUpInsideAction:(id)controller selector:(SEL)selector {
    for (UIButton *btn in _svContent.subviews) {
        [btn addTarget:controller action:selector forControlEvents:UIControlEventTouchUpInside];
    }
}

@end

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
@property (weak, nonatomic) IBOutlet VerticalButton *btnDelete;
@property (weak, nonatomic) IBOutlet VerticalButton *btnCamera;
@property (weak, nonatomic) IBOutlet VerticalButton *btnNewFolder;
@property (weak, nonatomic) IBOutlet VerticalButton *btnAddFile;
@property (weak, nonatomic) IBOutlet VerticalButton *btnShare;
@property (weak, nonatomic) IBOutlet VerticalButton *btnCloudUpload;
@property (weak, nonatomic) IBOutlet VerticalButton *btnCopy;
@property (weak, nonatomic) IBOutlet VerticalButton *btnMove;
@property (weak, nonatomic) IBOutlet VerticalButton *btnPhoto;
@property (weak, nonatomic) IBOutlet VerticalButton *btnSong;
@property (weak, nonatomic) IBOutlet VerticalButton *btnCloudDownload;

@end

@implementation ToolBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.type = ToolBarTypeDefault;
    
    self.btnSelect.tag = TOOL_BAR_ACTION_SELECT;
    self.btnDelete.tag = TOOL_BAR_ACTION_DELETE;
    self.btnCamera.tag = TOOL_BAR_ACTION_CAMERA;
    self.btnNewFolder.tag = TOOL_BAR_ACTION_NEWFOLDER;
    self.btnAddFile.tag = TOOL_BAR_ACTION_ADDFILES;
    self.btnShare.tag = TOOL_BAR_ACTION_SHARE;
    self.btnCloudUpload.tag = TOOL_BAR_ACTION_CLOUD_UPLOAD;
    self.btnCopy.tag = TOOL_BAR_ACTION_COPY;
    self.btnMove.tag = TOOL_BAR_ACTION_MOVE;
    self.btnPhoto.tag = TOOL_BAR_ACTION_PHOTO;
    self.btnSong.tag = TOOL_BAR_ACTION_ADD_SONG;
    self.btnCloudDownload.tag = TOOL_BAR_ACTION_CLOUD_DOWNLOAD;
}

- (void)setType:(ToolBarType)type {
    _type = type;
   
    for (UIButton *btn in [_svContent subviews]) {
        btn.hidden = YES;
    }
    
    if (_type == ToolBarTypeDefault) {
        self.btnSelect.hidden = NO;
        self.btnPhoto.hidden = NO;
        self.btnCamera.hidden = NO;
        self.btnSong.hidden = NO;
        self.btnNewFolder.hidden = NO;
        self.btnCloudDownload.hidden = NO;
    }
    else if (_type == ToolBarTypeDelete) {
        self.btnSelect.hidden = NO;
        self.btnDelete.hidden = NO;
        self.btnShare.hidden = NO;
        self.btnCloudUpload.hidden = NO;
        self.btnCopy.hidden = NO;
        self.btnMove.hidden = NO;
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

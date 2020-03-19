//
//  CToolBar.h
//  MyDocs
//
//  Created by 김학철 on 2020/03/18.
//  Copyright © 2020 김학철. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VerticalButton.h"

typedef NS_ENUM(NSUInteger, ToolBarType) {
    ToolBarTypeDefault,
    ToolBarTypeDelete,
};

typedef NS_ENUM(NSUInteger, TAG_TOOL_BTN) {
    TAG_TOOL_BTN_SELECT = 11111,
    TAG_TOOL_BTN_SORT,
    TAG_TOOL_BTN_NEWFOLDER,
    TAG_TOOL_BTN_ADDFILES,
    TAG_TOOL_BTN_DELETE,
};

IB_DESIGNABLE
NS_ASSUME_NONNULL_BEGIN

@interface CToolBar : UIView
@property (weak, nonatomic) IBOutlet VerticalButton *btnSelect;
@property (weak, nonatomic) IBOutlet VerticalButton *btnSort;
@property (weak, nonatomic) IBOutlet VerticalButton *btnNewFolder;
@property (weak, nonatomic) IBOutlet VerticalButton *btnDelete;
@property (weak, nonatomic) IBOutlet VerticalButton *btnAddFile;

@property (weak, nonatomic) IBOutlet UIStackView *svContainer;
@property (weak, nonatomic) IBOutlet UIView *saftyView;
@property (nonatomic, assign) ToolBarType type;
- (void)addTouchUpInsideAction:(id)controller selector:(SEL)selector;
@end

NS_ASSUME_NONNULL_END

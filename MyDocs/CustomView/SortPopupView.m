//
//  SortPopupView.m
//  MyDocs
//
//  Created by 김학철 on 2020/03/30.
//  Copyright © 2020 김학철. All rights reserved.
//

#import "SortPopupView.h"


@implementation SortPopupView
- (void)awakeFromNib {
    [super awakeFromNib];
}

- (IBAction)onClickedButtonAction:(CButton *)sender {
    FILE_SORT_TYPE sortType;
    if (sender == _btnSortName) {
        sortType = FILE_SORT_TYPE_NAME;
    }
    else if (sender == _btnSortSize) {
        sortType = FILE_SORT_TYPE_SIZE;
    }
    else if (sender == _btnSortCreateDate) {
        sortType = FILE_SORT_TYPE_CREATE_DATE;
    }
    else if (sender == _btnSortModiDate) {
        sortType = FILE_SORT_TYPE_MODI_DATE;
    }
    else {
        sortType = FILE_SORT_TYPE_ITEM_COUNT;
    }
    
    if (self.onClickedTouchUpInside) {
        self.onClickedTouchUpInside(sortType);
    }
}
@end

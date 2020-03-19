//
//  SearchBar.m
//  MyDocs
//
//  Created by 김학철 on 2020/03/04.
//  Copyright © 2020 김학철. All rights reserved.
//

#import "SearchBar.h"

@implementation SearchBar
- (void)awakeFromNib {
    [super awakeFromNib];
    _tfSearch.delegate = self;
}

- (IBAction)textFieldEdtingChanged:(UITextField *)sender {
    if ([self.delegate respondsToSelector:@selector(searchBar:editingChangedString:)]) {
        [_delegate searchBar:self editingChangedString:sender.text];
    }
}

- (IBAction)onClickedButtonAction:(UIButton *)sender {
    sender.selected = !sender.selected;
    LIST_TYPE type;
    if (sender.selected) {
        type = LIST_TYPE_COLLECTION;
    }
    else {
        type = LIST_TYPE_TABLE;
    }
    
    if ([self.delegate respondsToSelector:@selector(searchBar:changedListType:)]) {
        [_delegate searchBar:self changedListType:type];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([self.delegate respondsToSelector:@selector(searchBar:textFieldShouldReturn:)]) {
        return [_delegate searchBar:self textFieldShouldReturn:textField];
    }
    return YES;
}
@end

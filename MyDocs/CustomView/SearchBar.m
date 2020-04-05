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
    [self loadXib];
}
- (void)prepareForInterfaceBuilder {
    [super prepareForInterfaceBuilder];
}
- (id)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        [self loadXib];
    }
    return self;
}

- (void)loadXib {
    UIView *xib = [[UINib nibWithNibName:@"SearchBar" bundle:[NSBundle mainBundle]] instantiateWithOwner:self options:nil].firstObject;
    xib.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:xib];
    [xib.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:0].active = YES;
    [xib.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:0].active = YES;
    [xib.topAnchor constraintEqualToAnchor:self.topAnchor constant:0].active = YES;
    [xib.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:0].active = YES;
    
    _tfSearch.delegate = self;
    
}

- (IBAction)textFieldEdtingChanged:(UITextField *)sender {
    if ([self.delegate respondsToSelector:@selector(editingChangedString:)]) {
        [_delegate editingChangedString:sender.text];
    }
}

- (IBAction)onClickedButtonAction:(UIButton *)sender {
    if (sender == _btnListType) {
        sender.selected = !sender.selected;
        LIST_TYPE type;
        if (sender.selected) {
            type = LIST_TYPE_COLLECTION;
        }
        else {
            type = LIST_TYPE_TABLE;
        }
        
        if ([self.delegate respondsToSelector:@selector(changedListType:)]) {
            [_delegate changedListType:type];
        }
    }
    else if (sender == _btnSort) {
        if ([self.delegate respondsToSelector:@selector(didclickedSort)]) {
            [_delegate didclickedSort];
        }
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([self.delegate respondsToSelector:@selector(textFieldShouldReturn:)]) {
        return [_delegate textFieldShouldReturn:textField];
    }
    return YES;
}
@end

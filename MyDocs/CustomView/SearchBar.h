//
//  SearchBar.h
//  MyDocs
//
//  Created by 김학철 on 2020/03/04.
//  Copyright © 2020 김학철. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTextField.h"
#import "Constants.h"

IB_DESIGNABLE
NS_ASSUME_NONNULL_BEGIN

@protocol SearchBarDelegate  <NSObject>
@optional
- (void)editingChangedString:(NSString *)text;
- (BOOL)textFieldShouldReturn:(UITextField *)textFiled;

- (void)didclickedSort;
- (void)changedListType:(LIST_TYPE)listType;

@end
@interface SearchBar : UIView <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet CTextField *tfSearch;
@property (weak, nonatomic) IBOutlet UIButton *btnListType;
@property (weak, nonatomic) IBOutlet UIButton *btnSort;
@property (nonatomic, weak) id <SearchBarDelegate>delegate;
@end

NS_ASSUME_NONNULL_END

//
//  SortPopupView.h
//  MyDocs
//
//  Created by 김학철 on 2020/03/30.
//  Copyright © 2020 김학철. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CButton.h"
#import "Constants.h"
#import "CView.h"

IB_DESIGNABLE

NS_ASSUME_NONNULL_BEGIN
@interface SortPopupView : CView
@property (weak, nonatomic) IBOutlet CButton *btnSortName;
@property (weak, nonatomic) IBOutlet CButton *btnSortSize;
@property (weak, nonatomic) IBOutlet CButton *btnSortCreateDate;
@property (weak, nonatomic) IBOutlet CButton *btnSortModiDate;
@property (unsafe_unretained, nonatomic) IBOutlet CButton *btnItemCount;

@property (nonatomic, copy) void (^onClickedTouchUpInside) (FILE_SORT_TYPE sortType);
- (void)setOnClickedTouchUpInside:(void (^ _Nonnull)(FILE_SORT_TYPE sortType))onClickedTouchUpInside;
@end

NS_ASSUME_NONNULL_END

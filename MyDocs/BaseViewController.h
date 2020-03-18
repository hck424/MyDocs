//
//  BaseViewController.h
//  MyFiles
//
//  Created by 김학철 on 2020/01/22.
//  Copyright © 2020 김학철. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Utility.h"
#import "SearchBar.h"
#import "CToolBar.h"

NS_ASSUME_NONNULL_BEGIN
IB_DESIGNABLE
@interface BaseViewController : UIViewController
@property (nonatomic, strong) SearchBar *searchBar;
@property (nonatomic, strong) CToolBar *toolBar;
@property (nonatomic, assign) BOOL showSearchBar;
@property (nonatomic, assign) BOOL showToolBar;
@end

NS_ASSUME_NONNULL_END

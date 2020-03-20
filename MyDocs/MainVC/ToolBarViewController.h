//
//  ToolBarViewController.h
//  MyDocs
//
//  Created by 김학철 on 2020/03/19.
//  Copyright © 2020 김학철. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VerticalButton.h"
#import "Constants.h"
NS_ASSUME_NONNULL_BEGIN
IB_DESIGNABLE
@interface ToolBarViewController : UIViewController
@property (nonatomic, assign) ToolBarType type;
- (void)addTouchUpInsideAction:(id)controller selector:(SEL)selector;
- (void)removeUpInsideAction:(id)controller selector:(SEL)selector;
@end

NS_ASSUME_NONNULL_END

//
//  SceneDelegate.h
//  MyDocs
//
//  Created by 김학철 on 2020/03/03.
//  Copyright © 2020 김학철. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootNavigationController.h"

@interface SceneDelegate : UIResponder <UIWindowSceneDelegate>

@property (strong, nonatomic) UIWindow * window;

+ (SceneDelegate *)instance;
- (RootNavigationController *)rootNavigationController;
- (void)callMainViewController;
@end


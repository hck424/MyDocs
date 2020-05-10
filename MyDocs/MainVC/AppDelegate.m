//
//  AppDelegate.m
//  MyDocs
//
//  Created by 김학철 on 2020/03/03.
//  Copyright © 2020 김학철. All rights reserved.
//

#import "AppDelegate.h"
#import "KafkaRefresh.h"
#import "LanguageInfo.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

+ (AppDelegate *)instance {
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}
- (RootNavigationController *)rootNavigationController {
    MainViewController *mainViewController = (MainViewController *)[self.window rootViewController];
    return (RootNavigationController *)mainViewController.rootViewController;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[KafkaRefreshDefaults standardRefreshDefaults] setHeadDefaultStyle:KafkaRefreshStyleAnimatableRing];
    
    NSString *countryCode = UserCountryCode;
    if (countryCode.length == 0) {
        countryCode = @"KR";
        [[NSUserDefaults standardUserDefaults] setObject:countryCode forKey:@"USER_COUNTRY_CODE"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    LanguageInfo *lngInfo = [[LanguageInfo alloc] initWithCountryCode:countryCode];
    [NSBundle setLanguage:lngInfo.localizeTblName];
    
    if (@available(iOS 13.0, *)) {
    }
    else {
        self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        BOOL tutorialShow = [[NSUserDefaults standardUserDefaults] boolForKey:ShowTutorial];
        if (tutorialShow == NO) {
            [[AppDelegate instance] callTutorialViewController];
        }
        else {
            [[AppDelegate instance] callMainViewController];
        }
    }
    return YES;
}

- (void)callTutorialViewController {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    TutorialViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"TutorialViewController"];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
}

- (void)callMainViewController {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.mainViewController = [storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
    self.window.rootViewController = _mainViewController;
    [_mainViewController setupWithType:1];
    [self.window makeKeyAndVisible];
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
    
//    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    if (_restrictRotation) {
        return UIInterfaceOrientationMaskLandscape;
    }
    else {
        return UIInterfaceOrientationMaskPortrait;
    }
//    return orientation;
}
#pragma mark - UISceneSession lifecycle

- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options  API_AVAILABLE(ios(13.0)) API_AVAILABLE(ios(13.0)) API_AVAILABLE(ios(13.0)){
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    if (@available(iOS 13.0, *)) {
        return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
    }
    return nil;
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions  API_AVAILABLE(ios(13.0)){
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end

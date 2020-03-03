#import "SceneDelegate.h"
#import "NSBundle+Language.h"
#import "MainViewController.h"
#import "TutorialViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate

+ (SceneDelegate *)instance {
    return (SceneDelegate *)[[UIApplication sharedApplication].connectedScenes allObjects].firstObject.delegate;
}

- (RootNavigationController *)rootNavigationController {
    MainViewController *mainViewController = (MainViewController *)[self.window rootViewController];
    return (RootNavigationController *)mainViewController.rootViewController;
}
- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    
    NSString *selRootId = [[NSUserDefaults standardUserDefaults] objectForKey:SelectedRootId];
    if (selRootId.length == 0) {
        [[NSUserDefaults standardUserDefaults] setObject:RootIdHome forKey:SelectedRootId];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    [NSBundle setLanguage:UserLanguageTblName];
    
    UIWindowScene *windowScene = (UIWindowScene *)scene;
    self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
    
    BOOL tutorialShow = [[NSUserDefaults standardUserDefaults] boolForKey:ShowTutorial];
    if (tutorialShow == NO) {
        [self callTutorialViewController];
    }
    else {
        [self callMainViewController];
    }
}
- (void)callTutorialViewController {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    TutorialViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"TutorialViewController"];
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
}

- (void)callMainViewController {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MainViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
    [vc setupWithType:1];
    RootNavigationController *rootNaviCon = [storyboard instantiateViewControllerWithIdentifier:@"RootNavigationController"];
    vc.rootViewController = rootNaviCon;
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
}
- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end

#import "SceneDelegate.h"
#import "AppDelegate.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate

+ (SceneDelegate *)instance {
    if (@available(iOS 13.0, *)) {
        return (SceneDelegate *)[[UIApplication sharedApplication].connectedScenes allObjects].firstObject.delegate;
    }
    return nil;
}

- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions  API_AVAILABLE(ios(13.0)){
        
    if (@available(iOS 13.0, *)) {
        UIWindowScene *windowScene = (UIWindowScene *)scene;
        self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
        [AppDelegate instance].window = self.window;
        
        BOOL tutorialShow = [[NSUserDefaults standardUserDefaults] boolForKey:ShowTutorial];
        if (tutorialShow == NO) {
            [[AppDelegate instance] callTutorialViewController];
        }
        else {
            [[AppDelegate instance] callMainViewController];
        }
    }
}

- (void)sceneDidDisconnect:(UIScene *)scene  API_AVAILABLE(ios(13.0)){
    
}


- (void)sceneDidBecomeActive:(UIScene *)scene  API_AVAILABLE(ios(13.0)){
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene  API_AVAILABLE(ios(13.0)){
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene  API_AVAILABLE(ios(13.0)){
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene  API_AVAILABLE(ios(13.0)){
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end

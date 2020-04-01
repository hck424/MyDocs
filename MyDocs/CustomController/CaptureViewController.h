//
//  CaptureViewController.h
//  MyDocs
//
//  Created by 김학철 on 2020/03/31.
//  Copyright © 2020 김학철. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VerticalButton.h"
#import "CLabel.h"
#import <MediaPlayer/MediaPlayer.h>
IB_DESIGNABLE
NS_ASSUME_NONNULL_BEGIN
@protocol CaptureViewControllerDelegate <NSObject>

- (void)captureControllerDidExit:(id)captureController;
@end
@interface CaptureViewController : UIViewController
@property (nonatomic, weak) id <CaptureViewControllerDelegate>delegate;
@end

NS_ASSUME_NONNULL_END

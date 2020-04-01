//
//  CameraViewController.m
//  MyDocs
//
//  Created by 김학철 on 2020/03/31.
//  Copyright © 2020 김학철. All rights reserved.
//

#import "CameraViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "CaptureViewController.h"
#import "AppDelegate.h"

@interface CameraViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate, CaptureViewControllerDelegate>

@end

@implementation CameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self permissionCheck];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)permissionCheck {
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    
    //사용자가 강제로 카메라 접근을 껏을 경우 설정 페이지 유도
    if (authStatus == AVAuthorizationStatusDenied) {
        UIAlertController *alertCon = [UIAlertController alertControllerWithTitle:@"Unable to access the Camera"
                                                                          message:@"To enable access, go to Settings > Privacy > Camera and turn on Camera access for this app."
                                                                   preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [alertCon dismissViewControllerAnimated:YES completion:nil];
        }];
        [alertCon addAction:okAction];
        
        UIAlertAction *settingAction = [UIAlertAction actionWithTitle:@"Settings" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            NSURL *settingsUrl = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
            if ([[UIApplication sharedApplication] canOpenURL:settingsUrl]) {
                [[UIApplication sharedApplication] openURL:settingsUrl options:@{} completionHandler:nil];
            }
            else {
                [alertCon dismissViewControllerAnimated:YES completion:nil];
            }
        }];
        [alertCon addAction:settingAction];
        [self presentViewController:alertCon animated:YES completion:nil];
    }
    else if (authStatus == AVAuthorizationStatusNotDetermined) {
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            if (granted) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self openPicker:self.soureType];
                });
            }
        }];
    }
    else {
        [self openPicker:_soureType];
    }
}

- (void)openPicker:(UIImagePickerControllerSourceType)soureType {
    
    
    if (soureType == UIImagePickerControllerSourceTypeCamera) {
        CaptureViewController *vc = [[CaptureViewController alloc] init];
        vc.delegate = self;
        vc.modalPresentationStyle = UIModalPresentationFullScreen;
        vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:vc animated:NO completion:nil];
    }
    else {
        __block UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.sourceType = soureType;
        picker.allowsEditing = NO;
        picker.delegate = self;
        picker.cameraOverlayView.layer.borderColor = [UIColor redColor].CGColor;
        picker.cameraOverlayView.layer.borderWidth = 1.0f;
        picker.navigationBarHidden = YES;
        picker.toolbarHidden = YES;
        picker.showsCameraControls = NO;
        picker.extendedLayoutIncludesOpaqueBars = YES;
    
        picker.modalPresentationStyle = UIModalPresentationOverFullScreen;
        picker.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:picker animated:NO completion:nil];
    }
}

#pragma mark - UIImagePickerDelegate
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:NO completion:nil];
    [self.navigationController popViewControllerAnimated:NO];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    
}

#pragma mark - CaptureViewControllerDelegate
- (void)captureControllerDidExit:(UIViewController *)captureController {
    [captureController dismissViewControllerAnimated:NO completion:nil];
    [self.navigationController popViewControllerAnimated:NO];
}
@end

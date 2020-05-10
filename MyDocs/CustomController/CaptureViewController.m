//
//  CaptureViewController.m
//  MyDocs
//
//  Created by 김학철 on 2020/03/31.
//  Copyright © 2020 김학철. All rights reserved.
//

#import "CaptureViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import "AppDelegate.h"
#import "CropControlView.h"

#define CAMERA_SHUTTER_SOUND    @"CameraShutter_Haptic"

@interface CaptureViewController () <AVCaptureVideoDataOutputSampleBufferDelegate>
@property (weak, nonatomic) IBOutlet UIStackView *svControl;
@property (weak, nonatomic) IBOutlet UIView *preView;
@property (weak, nonatomic) IBOutlet UIImageView *ivPreView;
@property (weak, nonatomic) IBOutlet UIButton *btnImgCount;

@property (weak, nonatomic) IBOutlet UIButton *btnExit;
@property (weak, nonatomic) IBOutlet UIButton *btnPage;
@property (weak, nonatomic) IBOutlet UIButton *btnShot;
@property (weak, nonatomic) IBOutlet UIButton *btnTimer;
@property (weak, nonatomic) IBOutlet UIButton *btnSound;
@property (weak, nonatomic) IBOutlet UIView *captureView;
@property (weak, nonatomic) IBOutlet UILabel *lbDownCount;
@property (weak, nonatomic) IBOutlet CropControlView *cropControl;


@property (nonatomic, strong) AVCaptureSession *session;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *previewLayer;
@property (nonatomic, assign) BOOL enableCapture;
@property (nonatomic, strong) UIImage *originImg;
@property (nonatomic, assign) BOOL toolBarHidden;
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;
@property (nonatomic, strong) NSMutableArray *arrImg;

@property (nonatomic, assign) NSInteger second;
@property (nonatomic, assign) NSInteger downCount;
@property (nonatomic, strong) NSTimer *timerSecod;
@property (nonatomic, strong) NSTimer *timerDownCount;


@end

@implementation CaptureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeCaptuere];
    NSError *setCategoryErr = nil;
    NSError *activationErr  = nil;
    self.arrImg = [NSMutableArray array];
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error: &setCategoryErr];
    [[AVAudioSession sharedInstance] setActive:YES error: &activationErr];

    NSURL *url = [self getSystemSoundUrlByPrefix:CAMERA_SHUTTER_SOUND];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [_audioPlayer setVolume:1.0];
    
    _ivPreView.layer.borderColor = RGB(0, 133, 255).CGColor;
    _ivPreView.layer.borderWidth = 1.0f;
    
    
    [self.btnSound sendActionsForControlEvents:UIControlEventTouchUpInside];
    _lbDownCount.hidden = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGesture:)];
    [_cropControl addGestureRecognizer:tap];
    _cropControl.isOnePage = YES;
    
}
- (void)prepareForInterfaceBuilder {
    [super prepareForInterfaceBuilder];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [_session startRunning];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationHandler:) name:UIDeviceOrientationDidChangeNotification object:nil];

}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.view layoutIfNeeded];
     
    [self updateImageCount];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [_session stopRunning];

    [AppDelegate instance].restrictRotation = NO;
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceOrientationDidChangeNotification object:nil];
    [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIInterfaceOrientationPortrait] forKey:@"orientation"];
    [self shouldAutorotate];
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (void)setToolBarHidden:(BOOL)toolBarHidden {
    _toolBarHidden = toolBarHidden;
    if (_toolBarHidden) {
        _svControl.hidden = _preView.hidden = YES;
    }
    else {
        _svControl.hidden = _preView.hidden = NO;
    }
    
}
- (IBAction)singleTapGesture:(UITapGestureRecognizer *)sender {
    self.toolBarHidden = !_toolBarHidden;
}
- (void)updateImageCount {
    NSString *title = [NSString stringWithFormat:@"%ld", self.arrImg.count];
    [self.btnImgCount setTitle:title forState:UIControlStateNormal];
    _btnImgCount.layer.cornerRadius = 8.0f;
    _btnImgCount.clipsToBounds = YES;

}
- (IBAction)onClickedButtonActions:(UIButton *)sender {
    if (sender == _btnExit) {
        if ([self.delegate respondsToSelector:@selector(captureControllerDidExit:)]) {
            [_delegate captureControllerDidExit:self];
        }
    }
    else if (sender == _btnTimer) {

        self.second = _second + 1;
        if (self.second % 6 == 0) {
            self.second = 0;
        }
    }
    else if (sender == _btnShot) {
        if (_second > 0) {
            sender.selected = !sender.selected;
            if (sender.selected) {
                [self stopTimerSecond];
                [self stopTimerDownCount];
                
                __weak typeof(self) weakSelf = self;
                [self startAnimationDownCount];
                self.timerDownCount = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
                    if (self.downCount < 0) {
                        self.downCount = self.second;
                    }
                    [weakSelf startAnimationDownCount];
                    self.downCount--;
                }];
                
                self.timerSecod = [NSTimer scheduledTimerWithTimeInterval:_second + 1 repeats:YES block:^(NSTimer * _Nonnull timer) {
                    self.enableCapture = YES;
                }];
            }
            else {
                [self stopTimerSecond];
                [self stopTimerDownCount];
            }
        }
        else {
            sender.selected = NO;
            self.enableCapture = YES;
        }
    }
    else if (sender == _btnPage) {
        sender.selected = !sender.selected;
        [AppDelegate instance].restrictRotation = sender.selected;
        
        if (sender.selected) {
            _cropControl.isOnePage = NO;
            [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIInterfaceOrientationLandscapeRight] forKey:@"orientation"];
            [self shouldAutorotate];
        }
        else {
            _cropControl.isOnePage = YES;
            [[UIDevice currentDevice] setValue:[NSNumber numberWithInteger:UIInterfaceOrientationPortrait] forKey:@"orientation"];
            [self shouldAutorotate];
        }
        [self setAvCaptureOrientation];
        [_cropControl resetPoint];
    }
    else if (sender == _btnSound) {
        sender.selected = !sender.selected;
        
    }
}

- (void)setSecond:(NSInteger)second {
    _second = second;
    
    [_btnTimer setImage:[UIImage imageNamed:[NSString stringWithFormat:@"timer_%ld", _second]] forState:UIControlStateNormal];
    self.downCount = second;
    _lbDownCount.text = [NSString stringWithFormat:@"%ld", _downCount];
    if (_second == 0) {
      _lbDownCount.hidden = YES;
    }
    else {
      _lbDownCount.hidden = NO;
    }
    
    [self stopTimerDownCount];
    [self stopTimerSecond];
    self.btnShot.selected = NO;
    
}
- (void)startAnimationDownCount {
    _lbDownCount.hidden = NO;
    _lbDownCount.text = [NSString stringWithFormat:@"%ld", _downCount];
    
    [UIView animateWithDuration:0.8 animations:^{
        self.lbDownCount.transform = CGAffineTransformMakeScale(0.5, 0.5);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            self.lbDownCount.transform = CGAffineTransformIdentity;
        }];
    }];
}
- (void)stopTimerSecond {
    if (_timerSecod) {
        [_timerSecod invalidate];
        self.timerSecod = nil;
    }
}
- (void)stopTimerDownCount {
    if (_timerDownCount) {
        [_timerDownCount invalidate];
        self.timerDownCount = nil;
    }
}

- (void)notificationHandler:(NSNotification *)notification {
    if ([notification.name isEqualToString:UIDeviceOrientationDidChangeNotification]) {
        NSLog(@"device orientation");
        [self setAvCaptureOrientation];
    }
}
- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
}

- (void)initializeCaptuere {
    /*We setup the input*/
    if (_session) {
        [_session stopRunning];
    }
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    AVCaptureDeviceInput *captureInput = [AVCaptureDeviceInput
                                          deviceInputWithDevice:device
                                          error:nil];
    /*We setupt the output*/
    AVCaptureVideoDataOutput *captureOutput = [[AVCaptureVideoDataOutput alloc] init];
    /*While a frame is processes in -captureOutput:didOutputSampleBuffer:fromConnection: delegate methods no other frames are added in the queue.
     If you don't want this behaviour set the property to NO */
    captureOutput.alwaysDiscardsLateVideoFrames = YES;
    /*We specify a minimum duration for each frame (play with this settings to avoid having too many frames waiting
     in the queue because it can cause memory issues). It is similar to the inverse of the maximum framerate.
     In this example we set a min frame duration of 1/10 seconds so a maximum framerate of 10fps. We say that
     we are not able to process more than 10 frames per second.*/
    //captureOutput.minFrameDuration = CMTimeMake(1, 10);
    
    /*We create a serial queue to handle the processing of our frames*/
    dispatch_queue_t queue;
    queue = dispatch_queue_create("cameraQueue", NULL);
    [captureOutput setSampleBufferDelegate:self queue:queue];
    //    dispatch_release(queue);
    // Set the video output to store frame in BGRA (It is supposed to be faster)
    NSString *key = (NSString*)kCVPixelBufferPixelFormatTypeKey;
    NSNumber *value = [NSNumber numberWithUnsignedInt:kCVPixelFormatType_32BGRA];
    NSDictionary *videoSettings = [NSDictionary dictionaryWithObject:value forKey:key];
    [captureOutput setVideoSettings:videoSettings];
    /*And we create a capture session*/
    self.session = [[AVCaptureSession alloc] init];
    /*We add input and output*/
    [self.session addInput:captureInput];
    [self.session addOutput:captureOutput];
    
    _session.sessionPreset = AVCaptureSessionPresetPhoto;
    self.previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:_session];
    [self setAvCaptureOrientation];
    _previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    [_captureView.layer addSublayer:_previewLayer];
}

- (void)setAvCaptureOrientation {
    AVCaptureVideoOrientation newOrientation = AVCaptureVideoOrientationPortrait;
    if ([AppDelegate instance].restrictRotation) {
        newOrientation = AVCaptureVideoOrientationLandscapeRight;
    }
    
    if ([self.previewLayer respondsToSelector:@selector(connection)]
        && [self.previewLayer.connection isVideoOrientationSupported]) {
        self.previewLayer.connection.videoOrientation = newOrientation;
    }
    self.previewLayer.frame = _captureView.bounds;
}
- (UIImageOrientation)getImageOrinentation {
    UIImageOrientation newImgOrinentation = UIImageOrientationRight;
    if ([AppDelegate instance].restrictRotation) {
        newImgOrinentation = UIImageOrientationUp;
    }
    return newImgOrinentation;
}
#pragma mark AVCaptureSession delegate
- (void)captureOutput:(AVCaptureOutput *)captureOutput
didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer
       fromConnection:(AVCaptureConnection *)connection {
    
    if (self.enableCapture) {
      
        CVImageBufferRef imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer);
        /*Lock the image buffer*/
        CVPixelBufferLockBaseAddress(imageBuffer,0);
        /*Get information about the image*/
        uint8_t *baseAddress = (uint8_t *)CVPixelBufferGetBaseAddress(imageBuffer);
        size_t bytesPerRow = CVPixelBufferGetBytesPerRow(imageBuffer);
        size_t width = CVPixelBufferGetWidth(imageBuffer);
        size_t height = CVPixelBufferGetHeight(imageBuffer);
        
        /*Create a CGImageRef from the CVImageBufferRef*/
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGContextRef newContext = CGBitmapContextCreate(baseAddress, width, height, 8, bytesPerRow, colorSpace, kCGBitmapByteOrder32Little | kCGImageAlphaPremultipliedFirst);
        CGImageRef newImage = CGBitmapContextCreateImage(newContext);
        
        /*We release some components*/
        CGContextRelease(newContext);
        CGColorSpaceRelease(colorSpace);
        
        /*We display the result on the custom layer. All the display stuff must be done in the main thread because
         UIKit is no thread safe, and as we are not in the main thread (remember we didn't use the main_queue)
         we use performSelectorOnMainThread to call our CALayer and tell it to display the CGImage.*/
        
        /*We display the result on the image view (We need to change the orientation of the image so that the video is displayed correctly).
         Same thing as for the CALayer we are not in the main thread so ...*/
        self.originImg = [UIImage imageWithCGImage:newImage scale:1.0 orientation:[self getImageOrinentation]];
        /*We relase the CGImageRef*/
        CGImageRelease(newImage);
        NSLog(@"caputure image size : %@", NSStringFromCGSize(self.originImg.size));
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.arrImg addObject:self.originImg];
            
            [self updateImageCount];
            self.ivPreView.image = self.originImg;
            if (self.btnSound.selected) {
                [self.audioPlayer play];
            }
            else {
                [self.audioPlayer stop];
            }
        });
        //        [self performSelectorOnMainThread:@selector(AddImageToParentView) withObject:nil waitUntilDone:YES];
        
        /*We unlock the  image buffer*/
        CVPixelBufferUnlockBaseAddress(imageBuffer,0);
        
        self.enableCapture = NO;
    }
}

- (NSURL *)getSystemSoundUrlByPrefix:(NSString *)prefix {
    
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    NSURL *directoryURL = [NSURL URLWithString:@"/System/Library/Audio/UISounds"];
    NSArray *keys = [NSArray arrayWithObject:NSURLIsDirectoryKey];
    
    NSDirectoryEnumerator *enumerator = [fileManager
                                         enumeratorAtURL:directoryURL
                                         includingPropertiesForKeys:keys
                                         options:0
                                         errorHandler:^(NSURL *url, NSError *error) {
        return YES;
    }];
    
    NSURL *foundedUrl = nil;
    
    for (NSURL *url in enumerator) {
        NSError *error;
        NSNumber *isDirectory = nil;
        if (! [url getResourceValue:&isDirectory forKey:NSURLIsDirectoryKey error:&error]) {
            // handle error
        }
        else if (! [isDirectory boolValue] && [[url absoluteString] containsString:prefix]) {
            NSLog(@"url: %@", url);
            foundedUrl = url;
            break;
        }
    }
    return foundedUrl;
}
@end

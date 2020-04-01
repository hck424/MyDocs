//
//  AudioListener.h
//  LiveScore
//
//  Created by 학철 on 2018. 4. 24..
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define NOTI_SYSTEM_VOLUME_CHANGE @"NOTI_SYSTEM_VOLUME_CHANGE"
@interface AudioListener : NSObject
- (CGFloat)getAudioVolume;
+ (AudioListener *)sharedInstance;
@end

//
//  AudioListener.m
//  LiveScore
//
//  Created by 학철 on 2018. 4. 24..
//

#import "AudioListener.h"
#import <AVFoundation/AVFoundation.h>

@implementation AudioListener

+ (AudioListener *)sharedInstance {
    static AudioListener *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[AudioListener alloc] init];
    });
    
    return sharedManager;
}

- (id) init {
    if (self = [super init]) {
        
        NSError *error;
        
        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord
                                                mode:AVAudioSessionModeSpokenAudio
                                             options:AVAudioSessionCategoryOptionDefaultToSpeaker
                                                    | AVAudioSessionCategoryOptionAllowBluetooth
                                               error:&error];
        
        [[AVAudioSession sharedInstance] setActive:NO
                                       withOptions:AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation
                                             error:&error];

        @try {
            [[AVAudioSession sharedInstance] addObserver:self forKeyPath:@"outputVolume" options:NSKeyValueObservingOptionNew context:nil];
        } @catch (NSException *e) {
            NSLog(@"%@", [e callStackSymbols]);
        }
        
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"outputVolume"]) {
        CGFloat volLevel = [[change objectForKey:NSKeyValueChangeNewKey] floatValue];
        NSNumber *level = [NSNumber numberWithFloat:volLevel];
        [[NSNotificationCenter defaultCenter] postNotificationName:NOTI_SYSTEM_VOLUME_CHANGE object:level];
    }
}

- (CGFloat)getAudioVolume {
    float vol = [AVAudioSession sharedInstance].outputVolume;
    return vol;
}

@end


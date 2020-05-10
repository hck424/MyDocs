//
//  CropControlView.h
//  MyDocs
//
//  Created by 김학철 on 2020/04/05.
//  Copyright © 2020 김학철. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol CropControlViewDelegate;

@interface CropControlView : UIView
@property (nonatomic, weak) id <CropControlViewDelegate>delegate;
@property (nonatomic, assign) BOOL isOnePage;
- (void)resetPoint;
@end

@protocol CropControlViewDelegate <NSObject>
- (void)cropControl:(CropControlView *)cropControlView arrPoint:(NSArray *)arrPoint arrPoint2:(NSArray *)arrPoint2;
@end
NS_ASSUME_NONNULL_END

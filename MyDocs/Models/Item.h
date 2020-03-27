//
//  Item.h
//  MyDocs
//
//  Created by 김학철 on 2020/03/26.
//  Copyright © 2020 김학철. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Item : NSObject
@property (nonatomic, strong) NSString *displayName;
@property (nonatomic, strong) NSString *userPath;
@property (nonatomic, strong) NSString *fileType;
@property (nonatomic, strong) NSString *ext;
@property (nonatomic, assign) NSInteger fileSize;
@property (nonatomic, strong) NSDate *createDate;
@property (nonatomic, strong) NSDate *modificationDate;
@property (nonatomic, assign) NSUInteger itemCount;
@end

NS_ASSUME_NONNULL_END

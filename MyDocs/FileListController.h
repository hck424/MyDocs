//
//  FileListController.h
//  MyDocs
//
//  Created by 김학철 on 2020/03/19.
//  Copyright © 2020 김학철. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
NS_ASSUME_NONNULL_BEGIN

@interface FileListController : UIViewController
@property (nonatomic, strong) NSString *rootPath;
@property (nonatomic, assign) LIST_TYPE listType;
@property (nonatomic, strong) NSString *searchString;

- (void)reloadData;
@end

NS_ASSUME_NONNULL_END

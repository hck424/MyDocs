//
//  DBManager.h
//  MyDocs
//
//  Created by 김학철 on 2020/03/26.
//  Copyright © 2020 김학철. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FCFileManager.h"
#import "Item.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^RES_COMPLETION)(NSArray * _Nullable result, NSError *_Nullable error);
@interface DBManager : NSObject
+ (DBManager *_Nullable)instance;
- (void)requestAllItemsWithPath:(NSString *_Nullable)path completion:(RES_COMPLETION _Nullable )completion;
NS_ASSUME_NONNULL_END
@end


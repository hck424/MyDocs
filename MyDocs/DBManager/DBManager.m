//
//  DBManager.m
//  MyDocs
//
//  Created by 김학철 on 2020/03/26.
//  Copyright © 2020 김학철. All rights reserved.
//

#import "DBManager.h"
@interface DBManager ()
@end
@implementation DBManager
+ (DBManager *)instance {
    static DBManager *shared = nil;
    static dispatch_once_t onceToke;
    dispatch_once(&onceToke, ^{
        shared = [[DBManager alloc] init];
    });
    return shared;
}

- (NSString *)userPathByFullPath:(NSString *)path {
    NSArray *arr = [path componentsSeparatedByString:@"/"];
    NSMutableString *userPath = [NSMutableString string];
    BOOL find = NO;
    NSInteger j = 0;
    for (NSInteger i = 0; i < arr.count; i++) {
        NSString *tmpStr = [arr objectAtIndex:i];
        if (find) {
            if (j == 0) {
                [userPath appendFormat:@"%@", tmpStr];
            }
            else {
                [userPath appendFormat:@"/%@", tmpStr];
            }
            j++;
        }
        
        if ([tmpStr isEqualToString:@"Documents"]) {
            find = YES;
        }
    }
    return userPath;
}

- (NSString *)getDisPlayName:(NSString *)path {
    NSArray *arr = [path componentsSeparatedByString:@"/"];
    return [arr lastObject];
}

- (NSString *)getExtsion:(NSString *)fileName {
    NSArray *arr = [fileName componentsSeparatedByString:@"."];
    return [arr lastObject];
}
- (Item *)getItemWithPath:(NSString *)fullPath {
    Item *item = [[Item alloc] init];
    
    NSString *userPath = [self userPathByFullPath:fullPath];
    NSDictionary *itemDic = [FCFileManager attributesOfItemAtPath:userPath error:nil];
    
    item.displayName = [self getDisPlayName:userPath];
    item.userPath = userPath;
    item.createDate = [itemDic objectForKey:NSFileCreationDate];
    item.modificationDate = [itemDic objectForKey:NSFileModificationDate];
    item.fileSize = [[itemDic objectForKey:NSFileSize] floatValue];
    item.fileType = [itemDic objectForKey:NSFileType];
    
    if ([item.fileType isEqualToString:NSFileTypeDirectory] == NO) {
        item.ext = [self getExtsion:item.displayName];
        item.itemCount = 0;
    }
    else {
        NSString *tmpStr = [NSString stringWithFormat:@"%@/", item.userPath];
        NSArray *arr = [FCFileManager listItemsInDirectoryAtPath:tmpStr deep:NO];
        item.itemCount = arr.count;
    }
    
    return item;
}

- (void)requestAllItemsWithPath:(NSString *)path completion:(RES_COMPLETION)completion {
    
    NSArray *arr = [FCFileManager listItemsInDirectoryAtPath:path deep:NO];
   
    if (arr.count > 0) {
        NSMutableArray *arrData = [NSMutableArray array];
        for (NSString *fulPath in arr) {
            Item *item = [self getItemWithPath:fulPath];
            [arrData addObject:item];
        }
        
        if (completion) {
            completion(arrData, nil);
        }
    }
    else {
        if (completion) {
            completion(nil, nil);
        }
    }
}
@end

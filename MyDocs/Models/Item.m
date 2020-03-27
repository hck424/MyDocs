//
//  Item.m
//  MyDocs
//
//  Created by 김학철 on 2020/03/26.
//  Copyright © 2020 김학철. All rights reserved.
//

#import "Item.h"

@implementation Item

- (NSString *)description {
    NSMutableString *des = [NSMutableString string];
    [des appendFormat:@"displayName : %@\r", _displayName];
    [des appendFormat:@"userPath : %@\r", _userPath];
    [des appendFormat:@"fileType : %@\r", _fileType];
    [des appendFormat:@"ext : %@\r", _ext];
    [des appendFormat:@"fileSize : %ld\r", _fileSize];
    [des appendFormat:@"createDate : %@\r", _createDate];
    [des appendFormat:@"modificationDate : %@\r", _modificationDate];
    [des appendFormat:@"itemCount : %lu\r", (unsigned long)_itemCount];
    
    return des;
}
@end

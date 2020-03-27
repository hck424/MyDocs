//
//  FileCollectionCell.m
//  MyDocs
//
//  Created by 김학철 on 2020/03/19.
//  Copyright © 2020 김학철. All rights reserved.
//

#import "FileCollectionCell.h"
@interface FileCollectionCell()
@property (nonatomic, strong) Item *item;
@end
@implementation FileCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)configurationData:(Item *)item {
    self.item = item;
}
@end

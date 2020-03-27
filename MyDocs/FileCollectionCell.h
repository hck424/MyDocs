//
//  FileCollectionCell.h
//  MyDocs
//
//  Created by 김학철 on 2020/03/19.
//  Copyright © 2020 김학철. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"
NS_ASSUME_NONNULL_BEGIN

@interface FileCollectionCell : UICollectionViewCell
- (void)configurationData:(Item *)item;
@end

NS_ASSUME_NONNULL_END

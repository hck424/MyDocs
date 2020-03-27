//
//  FileCell.h
//  MyDocs
//
//  Created by 김학철 on 2020/03/19.
//  Copyright © 2020 김학철. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"
#import "Constants.h"

NS_ASSUME_NONNULL_BEGIN

@interface FileCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *ivThumnail;
@property (weak, nonatomic) IBOutlet UIButton *btnCheck;
@property (weak, nonatomic) IBOutlet UILabel *lbName;
@property (weak, nonatomic) IBOutlet UILabel *lbDes;
- (void)configurationData:(Item *)item sortType:(FILE_SORT_TYPE)sortType;
@end

NS_ASSUME_NONNULL_END

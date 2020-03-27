//
//  FileCell.m
//  MyDocs
//
//  Created by 김학철 on 2020/03/19.
//  Copyright © 2020 김학철. All rights reserved.
//

#import "FileCell.h"
@interface FileCell ()
@property (nonatomic, strong) Item *item;
@property (nonatomic, assign) FILE_SORT_TYPE sortType;
@property (nonatomic, strong) NSDateFormatter *df;

@end

@implementation FileCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.df = [[NSDateFormatter alloc] init];
    _df.calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    _df.dateFormat = @"yyyy.MM.dd HH:mm";
    _btnCheck.imageView.contentMode = UIViewContentModeScaleAspectFit;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)configurationData:(Item *)item sortType:(FILE_SORT_TYPE)sortType {
    self.item = item;
    self.sortType = sortType;
    
    _lbName.text = _item.displayName;
    
    if ([_item.fileType isEqualToString:NSFileTypeDirectory]) {
        _lbDes.text = [NSString stringWithFormat:NSLocalizedString(@"referal_count", nil), _item.itemCount];
        _ivThumnail.image = [UIImage imageNamed:@"icon_folder"];
    }
    else {
        _lbDes.text = [NSString stringWithFormat:@"%.1ld", (long)_item.fileSize];
    }
    
    if (_sortType == FILE_SORT_TYPE_SIZE) {
        
    }
    else if (_sortType == FILE_SORT_TYPE_CREATE_DATE) {
        
    }
    else if (_sortType == FILE_SORT_TYPE_MODI_DATE) {
        
    }
    else if (_sortType == FILE_SORT_TYPE_ITEM_COUNT) {
        
    }
    else {
        
    }
}

@end

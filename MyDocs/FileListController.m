//
//  FileListController.m
//  MyDocs
//
//  Created by 김학철 on 2020/03/19.
//  Copyright © 2020 김학철. All rights reserved.
//

#import "FileListController.h"
#import "FileCell.h"
#import "KafkaRefresh.h"
#import "FileCollectionCell.h"

@interface FileListController () <UITableViewDataSource, UITableViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tblView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation FileListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_collectionView registerNib:[UINib nibWithNibName:@"FileCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"FileCollectionCell"];
    _tblView.rowHeight = UITableViewAutomaticDimension;
    _tblView.estimatedRowHeight = 60.0f;
    __weak typeof(self)weakSelf = self;
    [_tblView bindHeadRefreshHandler:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf.tblView.headRefreshControl endRefreshing];
        });
    } themeColor:COLOR_APP_DEFAULT refreshStyle:KafkaRefreshStyleReplicatorCircle];
 
    [self reloadData];
}

- (void)willMoveToParentViewController:(UIViewController *)parent {
    [super willMoveToParentViewController:parent];
}
- (void)didMoveToParentViewController:(UIViewController *)parent {
    [super didMoveToParentViewController:parent];
}
- (void)setSearchString:(NSString *)searchString {
    _searchString = searchString;
}

- (void)reloadData {
    if (_listType == LIST_TYPE_TABLE) {
        _collectionView.hidden = YES;
        _tblView.hidden = NO;
        _tblView.delegate = self;
        _tblView.dataSource = self;
        _collectionView.delegate = nil;
        _collectionView.dataSource = nil;
        [_tblView reloadData];
    }
    else {
        _collectionView.hidden = NO;
        _tblView.hidden = YES;
        _tblView.delegate = nil;
        _tblView.dataSource = nil;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView reloadData];
    }
}

- (void)setListType:(LIST_TYPE)listType {
    _listType = listType;
    if ((_listType == LIST_TYPE_TABLE && _tblView != nil)
        || (_listType == LIST_TYPE_COLLECTION && _collectionView != nil)) {
        [self reloadData];
    }
}
//MARK::UITableViewDataSource, UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FileCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FileCell"];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"FileCell" owner:self options:nil].firstObject;
    }
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

//MARK:: UICollectionViewDataSource, UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((_collectionView.frame.size.width - 4)/3, 150);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 1, 1, 1);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 1;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    FileCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FileCollectionCell" forIndexPath:indexPath];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}
@end

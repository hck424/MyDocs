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
#import "AppDelegate.h"

@interface FileListController () <UITableViewDataSource, UITableViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource, SearchBarDelegate>
@property (weak, nonatomic) IBOutlet UIView *bgSearchView;
@property (weak, nonatomic) IBOutlet UIView *bgListView;
@property (weak, nonatomic) IBOutlet UITableView *tblView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) SearchBar *searchBar;
@end

@implementation FileListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.searchBar = [[NSBundle mainBundle] loadNibNamed:@"SearchBar" owner:self options:nil].firstObject;
    _searchBar.delegate = self;
    [_bgSearchView addSubview:_searchBar];
    _searchBar.translatesAutoresizingMaskIntoConstraints = NO;
    [_searchBar.topAnchor constraintEqualToAnchor:_bgSearchView.topAnchor constant:0].active = YES;
    [_searchBar.leadingAnchor constraintEqualToAnchor:_bgSearchView.leadingAnchor constant:0].active = YES;
    [_searchBar.bottomAnchor constraintEqualToAnchor:_bgSearchView.bottomAnchor constant:0].active = YES;
    [_searchBar.trailingAnchor constraintEqualToAnchor:_bgSearchView.trailingAnchor constant:0].active = YES;
    
    [_collectionView registerNib:[UINib nibWithNibName:@"FileCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"FileCollectionCell"];
    _tblView.rowHeight = UITableViewAutomaticDimension;
    _tblView.estimatedRowHeight = 60.0f;
    __weak typeof(self)weakSelf = self;
    
    [_tblView bindHeadRefreshHandler:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf.tblView.headRefreshControl endRefreshing];
        });
    } themeColor:COLOR_APP_DEFAULT refreshStyle:KafkaRefreshStyleReplicatorCircle];
 
    [_collectionView bindHeadRefreshHandler:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf.collectionView.headRefreshControl endRefreshing];
        });
    } themeColor:COLOR_APP_DEFAULT refreshStyle:KafkaRefreshStyleReplicatorCircle];
    [self reloadData];
    
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[AppDelegate instance].toolBarViewController addTouchUpInsideAction:self selector:@selector(onClickedButtonActions:)];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[AppDelegate instance].toolBarViewController removeUpInsideAction:self selector:@selector(onClickedButtonActions:)];
}
- (void)willMoveToParentViewController:(UIViewController *)parent {
    [super willMoveToParentViewController:parent];
}
- (void)didMoveToParentViewController:(UIViewController *)parent {
    [super didMoveToParentViewController:parent];
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

- (IBAction)onClickedButtonActions:(UIButton *)sender {
    
    if (sender.tag == TAG_TOOL_BTN_SELECT) {
        sender.selected = !sender.selected;
        if (sender.selected) {
            [AppDelegate instance].toolBarViewController.type = ToolBarTypeDelete;
        }
        else {
            [AppDelegate instance].toolBarViewController.type = ToolBarTypeDefault;
        }
    }
    else if (sender.tag == TAG_TOOL_BTN_SORT) {
        
    }
    else if (sender.tag == TAG_TOOL_BTN_DELETE) {
        
    }
    else if (sender.tag == TAG_TOOL_BTN_ADDFILES) {
        
    }
    else if (sender.tag == TAG_TOOL_BTN_NEWFOLDER) {
        
    }
}
#pragma mark SearchBarDelegate
- (void)searchBar:(id)searchBar changedListType:(LIST_TYPE)listType {
    self.listType = listType;
}
- (void)searchBar:(id)searchBar editingChangedString:(NSString *)text {
    
}
- (BOOL)searchBar:(id)searchBar textFieldShouldReturn:(UITextField *)textFiled {
    
    return YES;
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
    
    FileListController *vc = [[UIStoryboard storyboardWithName:@"Other" bundle:nil] instantiateViewControllerWithIdentifier:@"FileListController"];
    vc.title = @"aaa";
    [[AppDelegate instance].customNavigationController pushViewController:vc animated:YES];
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

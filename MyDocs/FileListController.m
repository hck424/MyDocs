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
#import "DBManager.h"
#import "Utility.h"
#import "SortPopupView.h"
#import "CBarButtonItem.h"
#import "UIView+Toast.h"
#import "CameraViewController.h"

@interface FileListController () <UITableViewDataSource, UITableViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource, SearchBarDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIView *bgListView;
@property (weak, nonatomic) IBOutlet UITableView *tblView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) IBOutlet SearchBar *searchBar;

@property (strong, nonatomic) SortPopupView *sortView;
@property (nonatomic, strong) NSArray *arrData;
@property (nonatomic, assign) FILE_SORT_TYPE sortType;
@property (nonatomic, strong) NSMutableArray *arrSelectItem;
@end

@implementation FileListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_collectionView registerNib:[UINib nibWithNibName:@"FileCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"FileCollectionCell"];
    _tblView.rowHeight = UITableViewAutomaticDimension;
    _tblView.estimatedRowHeight = 60.0f;
    
    __weak typeof(self)weakSelf = self;
    [_tblView bindHeadRefreshHandler:^{
        [weakSelf requestData];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf.tblView.headRefreshControl endRefreshing];
        });
    } themeColor:COLOR_APP_DEFAULT refreshStyle:KafkaRefreshStyleReplicatorCircle];
 
    [_collectionView bindHeadRefreshHandler:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf.collectionView.headRefreshControl endRefreshing];
        });
    } themeColor:COLOR_APP_DEFAULT refreshStyle:KafkaRefreshStyleReplicatorCircle];
}

- (void)prepareForInterfaceBuilder {
    [super prepareForInterfaceBuilder];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[AppDelegate instance].toolBarViewController addTouchUpInsideAction:self selector:@selector(onClickedToolBarActions:)];
    [self makeSortView];
    [self requestData];
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[AppDelegate instance].toolBarViewController removeUpInsideAction:self selector:@selector(onClickedToolBarActions:)];
}
- (void)willMoveToParentViewController:(UIViewController *)parent {
    [super willMoveToParentViewController:parent];
}
- (void)didMoveToParentViewController:(UIViewController *)parent {
    [super didMoveToParentViewController:parent];
}
- (void)makeSortView {
    if (_sortView) {
        [_sortView removeFromSuperview];
    }
    
    self.sortView = [[NSBundle mainBundle] loadNibNamed:@"SortPopupView" owner:self options:nil].firstObject;
    [self.view addSubview:_sortView];
    _sortView.translatesAutoresizingMaskIntoConstraints = NO;
    [_sortView.widthAnchor constraintEqualToConstant:145].active = YES;
    [_sortView.heightAnchor constraintEqualToConstant:190].active = YES;
    [_sortView.topAnchor constraintEqualToAnchor:_bgListView.topAnchor].active = YES;
    [_sortView.leadingAnchor constraintEqualToAnchor:_bgListView.leadingAnchor constant:10].active = YES;
    _sortView.hidden = YES;
    
    __weak typeof(self)weakSelf = self;
    [_sortView setOnClickedTouchUpInside:^(FILE_SORT_TYPE sortType) {
        weakSelf.sortType = sortType;
        [weakSelf makeSortData];
    }];
}
- (void)makeSortData {
    if (_sortType == FILE_SORT_TYPE_NAME) {
        NSLog(@"sort name");
    }
    else if (_sortType == FILE_SORT_TYPE_SIZE) {
        NSLog(@"sort size");
    }
    else if (_sortType == FILE_SORT_TYPE_CREATE_DATE) {
        NSLog(@"sort create date");
    }
    else if (_sortType == FILE_SORT_TYPE_MODI_DATE) {
        NSLog(@"sort modification date");
    }
    else if (_sortType == FILE_SORT_TYPE_ITEM_COUNT) {
        NSLog(@"sort item count");
    }
}

- (void)requestData {
    [[DBManager instance] requestAllItemsWithPath:_rootPath completion:^(NSArray * _Nullable result, NSError * _Nullable error) {
        if (result.count > 0) {
            self.arrData = result;
        }
        [self reloadData];
    }];
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
- (void)onClickedToolBarActions:(UIButton *)sender {
    if (sender.tag == TOOL_BAR_ACTION_SELECT) {
        sender.selected = !sender.selected;
        if (sender.selected) {
            [AppDelegate instance].toolBarViewController.type = ToolBarTypeDelete;
        }
        else {
            [AppDelegate instance].toolBarViewController.type = ToolBarTypeDefault;
        }
        [self reloadData];
    }
    else if (sender.tag == TOOL_BAR_ACTION_DELETE) {
        NSLog(@"tool btn delete");
        if (_arrSelectItem.count == 0) {
            [self.view makeToast:NSLocalizedString(@"no_file_selected", nil) duration:0.3 position:CSToastPositionTop];
        }
    }
    else if (sender.tag == TOOL_BAR_ACTION_ADDFILES) {
        NSLog(@"tool btn newfile");
    }
    else if (sender.tag == TOOL_BAR_ACTION_NEWFOLDER) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"new_folder", nil) message:@"" preferredStyle:UIAlertControllerStyleAlert];
        
        [alert addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"cancel", nil) style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [alert dismissViewControllerAnimated:NO completion:nil];
        }]];
        
        __weak typeof(self)weakSelf = self;
        [alert addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"ok", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSString *newFolderName = ((UITextField *)[alert textFields].firstObject).text;
            if (newFolderName.length > 0) {
                [weakSelf createNewFolder:newFolderName];
            }
            [alert dismissViewControllerAnimated:NO completion:nil];
        }]];
        
        
        [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = NSLocalizedString(@"create_new_folder_des", nil);
            [textField becomeFirstResponder];
        }];
        
        [[AppDelegate instance].rootNavigationController presentViewController:alert animated:YES completion:nil];
    }
    else if (sender.tag == TOOL_BAR_ACTION_CAMERA) {
        NSLog(@"tool btn camera");
        CameraViewController *vc = [[CameraViewController alloc] init];
        vc.soureType = UIImagePickerControllerSourceTypeCamera;
        [[AppDelegate instance].rootNavigationController pushViewController:vc animated:NO];
    }
    else if (sender.tag == TOOL_BAR_ACTION_PHOTO) {
        NSLog(@"tool btn photo libary");
    }
    else if (sender.tag == TOOL_BAR_ACTION_ADD_SONG) {
        NSLog(@"tool btn add songs");
    }
    else if (sender.tag == TOOL_BAR_ACTION_SHARE) {
        NSLog(@"tool btn share");
    }
    else if (sender.tag == TOOL_BAR_ACTION_CLOUD_UPLOAD) {
        NSLog(@"tool btn cloud upload");
    }
    else if (sender.tag == TOOL_BAR_ACTION_CLOUD_DOWNLOAD) {
        NSLog(@"tool btn cloud download");
    }
}
- (IBAction)onClickedButtonActions:(UIButton *)sender {
    
    if (sender.tag == TAG_NAVI_ITEM_BACK) {
        [self.navigationController popViewControllerAnimated:NO];
    }
}

- (void)createNewFolder:(NSString *)folderName {
    NSString *path = [NSString stringWithFormat:@"%@/%@", _rootPath, folderName];
    BOOL success = [FCFileManager createDirectoriesForPath:path];
    if (success) {
        [self requestData];
    }
}

- (void)notiHitViewAction:(NSNotification *)notification {

    [self.view endEditing:YES];
    if (_sortView.hidden == NO) {
        _sortView.hidden = YES;
    }
}
#pragma mark SearchBarDelegate
- (void)changedListType:(LIST_TYPE)listType {
    self.listType = listType;
}
- (void)editingChangedString:(NSString *)text {
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textFiled {
    return YES;
}
- (void)didclickedSort {
    _sortView.hidden = NO;
}

//MARK::UITableViewDataSource, UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _arrData.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FileCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FileCell"];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"FileCell" owner:self options:nil].firstObject;
    }
    
    Item *item = [_arrData objectAtIndex:indexPath.row];
    
    ToolBarType type = [AppDelegate instance].toolBarViewController.type;
    if (type == ToolBarTypeDefault) {
        [cell configurationData:item sortType:_sortType cellType:CELL_TYPE_DEFAULT];
    }
    else {
        [cell configurationData:item sortType:_sortType cellType:CELL_TYPE_SELECTION];
    }
    
    [cell setOnClickedTouchUpInside:^(UIButton * _Nonnull sender, Item * _Nonnull item) {
        if (self.arrSelectItem == nil) {
            self.arrSelectItem = [NSMutableArray array];
        }
        if (sender.selected) {
            [self.arrSelectItem addObject:item];
        }
        else {
            [self.arrSelectItem removeObject:item];
        }
    }];
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
    
    Item *item = [_arrData objectAtIndex:indexPath.row];
    if ([item.fileType isEqualToString:NSFileTypeDirectory]) {
        FileListController *vc = [[UIStoryboard storyboardWithName:@"Other" bundle:nil] instantiateViewControllerWithIdentifier:@"FileListController"];
        vc.title = item.displayName;
        vc.rootPath = item.userPath;
        [[AppDelegate instance].customNavigationController pushViewController:vc animated:YES];
    }
    else {
        
    }
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
    Item *item = [_arrData objectAtIndex:indexPath.row];
    [cell configurationData:item];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}
@end

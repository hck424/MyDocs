//
//  LeftTableViewController.m
//  MyFiles
//
//  Created by 김학철 on 2020/01/22.
//  Copyright © 2020 김학철. All rights reserved.
//

#import "LeftTableViewController.h"
#import "MainViewController.h"
#import "AppDelegate.h"
#import "LanguageViewController.h"

@interface LeftTableViewController ()
@property (nonatomic, strong) NSMutableArray *arrData;

@end

@implementation LeftTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrData = [NSMutableArray array];
    
    [self reloadData];
}

- (void)makeSectionData {
    
    NSDictionary *itemDic = [NSDictionary dictionaryWithObjectsAndKeys:[UIImage systemImageNamed:@"folder"], @"image", NSLocalizedString(@"home", @""), @"title", RootIdHome, @"rootId", nil];

    [_arrData addObject:[NSArray arrayWithObject:itemDic]];
  
    NSMutableArray *arrSec = [NSMutableArray array];
    itemDic = [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"iCloud"], @"image",
               NSLocalizedString(@"icloud", @""), @"title", RootIdiCloud, @"rootId", nil];
    [arrSec addObject:itemDic];
    
    itemDic = [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"dropbox"], @"image",
               NSLocalizedString(@"dropbox", @""), @"title", RootIdiDropBox, @"rootId", nil];
    [arrSec addObject:itemDic];
    
    itemDic = [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"google_drive"], @"image",
               NSLocalizedString(@"google_drive", @""), @"title", RootIdGoogle, @"rootId", nil];
    [arrSec addObject:itemDic];
    
    itemDic = [NSDictionary dictionaryWithObjectsAndKeys:[UIImage imageNamed:@"one_drive"], @"image",
               NSLocalizedString(@"one_drive", @""), @"title", RootIdiOneDrive, @"rootId", nil];
    [arrSec addObject:itemDic];
    [_arrData addObject:arrSec];
    
    itemDic = [NSDictionary dictionaryWithObjectsAndKeys:[UIImage systemImageNamed:@"a"], @"image",
               NSLocalizedString(@"language", @""), @"title", nil];
    [_arrData addObject:[NSArray arrayWithObject:itemDic]];
}
- (void)reloadData {
    [_arrData removeAllObjects];
    [self makeSectionData];
    
    [self.tableView reloadData];
}
#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[_arrData objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
    }
    
    NSDictionary *itemDic = [[_arrData objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    cell.imageView.image = [itemDic objectForKey:@"image"];
    cell.textLabel.text = [itemDic objectForKey:@"title"];
    
    NSString *rootId = [itemDic objectForKey:@"rootId"];
    NSString *curRootId = [[NSUserDefaults standardUserDefaults] objectForKey:SelectedRootId];
    if ([rootId isEqualToString:curRootId]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else {
        cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    cell.tintColor = [UIColor systemBlueColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return NSLocalizedString(@"local", @"");;
    }
    else if (section == 1) {
        return NSLocalizedString(@"cloud_service", @"");
    }
    else {
        return NSLocalizedString(@"setting", @"");
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    MainViewController *mainViewController = (MainViewController *)self.sideMenuController;
    [mainViewController hideLeftViewAnimated:YES delay:0.0 completionHandler:nil];
    
    NSDictionary *itemDic = [[_arrData objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            NSString *rootId = [itemDic objectForKey:@"rootId"];
            [[NSUserDefaults standardUserDefaults] setObject:rootId forKey:SelectedRootId];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            RootNavigationController *rootNaviVc = [AppDelegate instance].rootNavigationController;
            [rootNaviVc changeRootViewController];
            [self.tableView reloadData];
        }
    }
    else if (indexPath.section == 1) {
        NSString *rootId = [itemDic objectForKey:@"rootId"];
        [[NSUserDefaults standardUserDefaults] setObject:rootId forKey:SelectedRootId];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        RootNavigationController *rootNaviVc = [AppDelegate instance].rootNavigationController;
        [rootNaviVc changeRootViewController];
        [self.tableView reloadData];
        
    }
    else if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            LanguageViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"LanguageViewController"];
            [[AppDelegate instance].rootNavigationController pushViewController:vc animated:YES];
        }
    }
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     
}


@end

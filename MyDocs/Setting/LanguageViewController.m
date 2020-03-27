//
//  LanguageViewController.m
//  MyFiles
//
//  Created by 김학철 on 2020/01/23.
//  Copyright © 2020 김학철. All rights reserved.
//

#import "LanguageViewController.h"
#import "LanguageInfo.h"
#import "NSBundle+Language.h"
#import "CBarButtonItem.h"

@interface LanguageViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tblView;
@property (nonatomic, strong) NSMutableArray *arrData;
@property (nonatomic, strong) NSString *selCountryCode;
@end

@implementation LanguageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.selCountryCode = UserCountryCode;
    
    self.arrData = [NSMutableArray array];
    [self makeData];
    
    [CBarButtonItem naviBackBtn:self action:@selector(onClickedbuttonActions:)];
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = NO;
    [super viewWillAppear:animated];
    self.title = NSLocalizedString(@"language", @"");
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = YES;
}
- (IBAction)onClickedbuttonActions:(UIButton *)sender {
    if (sender.tag == TAG_NAVI_ITEM_BACK) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}
- (void)makeData {
    NSArray *arrCountry = [NSArray arrayWithObjects:@"KR", @"US", nil];
    
    for (NSString *code in arrCountry) {
        LanguageInfo *info = [[LanguageInfo alloc] initWithCountryCode:code];
        [_arrData addObject:info];
    }
    [self.tblView reloadData];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    LanguageInfo *info = [_arrData objectAtIndex:indexPath.row];
    if ([[info.countryCode lowercaseString] isEqualToString:[_selCountryCode lowercaseString]]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    cell.textLabel.text = info.languageName;
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 100.0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    LanguageInfo *info = [_arrData objectAtIndex:indexPath.row];
    self.selCountryCode = info.countryCode;
    
    [[NSUserDefaults standardUserDefaults] setObject:info.countryCode forKey:@"USER_COUNTRY_CODE"];
    [[NSUserDefaults standardUserDefaults] setObject:info.languageCode forKey:@"LANGUAGE_CODE"];
    [[NSUserDefaults standardUserDefaults] setObject:info.localIdentifier forKey:@"LOCAL_IDENTIFIER"];
    [[NSUserDefaults standardUserDefaults] setObject:info.localizeTblName forKey:@"LANGUAGE_TBL_NAME"];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    [NSBundle setLanguage:info.localizeTblName];
    self.title = NSLocalizedString(@"language", @"");

    [self.tblView reloadData];
}
@end

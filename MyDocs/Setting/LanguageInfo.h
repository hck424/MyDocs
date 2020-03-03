//
//  LanguageInfo.h
//  Hanpass
//
//  Created by 김학철 on 2020/02/06.
//  Copyright © 2020 hanpass. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LanguageInfo : NSObject
@property (nonatomic, strong) NSString *countryCode;
@property (nonatomic, strong) NSString *languageName;
@property (nonatomic, strong) NSString *languageCode;
@property (nonatomic, strong) NSString *localizeTblName;
@property (nonatomic, strong) NSString *localIdentifier;

- (instancetype)initWithCountryCode:(NSString *)countryCode;

@end

NS_ASSUME_NONNULL_END

//
//  NSBundle+Language.m
//  LiveScore
//
//  Created by 학철 on 29/05/2019.
//

#import "NSBundle+Language.h"
#import <objc/runtime.h>

static const char _bundle=0;
@interface BundleEx : NSBundle
@end

@implementation BundleEx

- (NSString*)localizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName
{
    NSBundle* bundle=objc_getAssociatedObject(self, &_bundle);
    return bundle ? [bundle localizedStringForKey:key value:value table:tableName] : [super localizedStringForKey:key value:value table:tableName];
}

@end

@implementation NSBundle (Language)

+(void)setLanguage:(NSString*)language {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        object_setClass([NSBundle mainBundle],[BundleEx class]);
    });
    
//    if ([LanguageManager isCurrentLanguageRTL]) {
//        if ([[[UIView alloc] init] respondsToSelector:@selector(setSemanticContentAttribute:)]) {
//            [[UIView appearance] setSemanticContentAttribute:UISemanticContentAttributeForceRightToLeft];
//            [[UITableView appearance] setSemanticContentAttribute:UISemanticContentAttributeForceRightToLeft];
//        }
//    }else {
//        if ([[[UIView alloc] init] respondsToSelector:@selector(setSemanticContentAttribute:)]) {
//            [[UIView appearance] setSemanticContentAttribute:UISemanticContentAttributeForceLeftToRight];
//            [[UITableView appearance] setSemanticContentAttribute:UISemanticContentAttributeForceLeftToRight];
//        }
//    }
    
    if (language.length == 0) {
        language = @"en";
    }
    
    id value = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:language ofType:@"lproj"]];
    
    objc_setAssociatedObject([NSBundle mainBundle], &_bundle, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

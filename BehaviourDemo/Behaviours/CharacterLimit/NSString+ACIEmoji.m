//
//  NSString+ACIEmoji.m
//  Util
//
//  Created by Carya on 11/10/2017.
//  Copyright © 2017 danlu. All rights reserved.
//

#import "NSString+ACIEmoji.h"
#import "NSString+EMOEmoji.h"

@implementation NSString (ACIEmoji)

- (NSArray<NSValue *> *)aci_emojiRanges {
    return [self emo_emojiRanges];
}

- (NSString *)aci_truncateTailingToMaxLength:(NSUInteger)maxLength {
    if ([self length] <= maxLength) {
        return self;
    }
    if (![self emo_containsEmoji]) {
        return [self substringToIndex:maxLength];
    }
    
    __block NSString *truncatedStr = self;
    NSArray<NSValue *> *emojiRanges = [self aci_emojiRanges];
    [emojiRanges enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(NSValue * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSRange range = [obj rangeValue];
        NSInteger maxRange = NSMaxRange(range);
        if (maxRange < maxLength) {  /**< emoji包含在截断后的字符串内部 */
            truncatedStr = [self substringToIndex:maxLength];
            *stop = YES;
        } else if (maxRange > maxLength && range.location + 1 <= maxLength) {  /**< emoji的长度有部分超出了maxLength之外 */
            truncatedStr = [self substringToIndex:range.location];
            *stop = YES;
        } else {  /**< emoji在maxLength之外 */
            truncatedStr = [self substringToIndex:range.location + 1];
        }
    }];
    
    if ([truncatedStr length] > maxLength) {
        truncatedStr = [truncatedStr substringToIndex:maxLength];
    }
    return truncatedStr;
}

@end

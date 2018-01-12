//
//  NSString+ACIEmoji.h
//  Util
//
//  Created by Carya on 11/10/2017.
//  Copyright © 2017 danlu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ACIEmoji)

- (NSArray<NSValue *> *)aci_emojiRanges;

- (NSString *)aci_truncateTailingToMaxLength:(NSUInteger)maxLength;

@end

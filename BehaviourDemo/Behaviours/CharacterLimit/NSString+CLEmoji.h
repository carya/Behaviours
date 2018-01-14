//
//  NSString+CLEmoji.h
//  Util
//
//  Created by Carya on 11/10/2017.
//  Copyright © 2017 danlu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CLEmoji)

- (NSArray<NSValue *> *)cl_emojiRanges;

- (NSString *)cl_truncateTailingToMaxLength:(NSUInteger)maxLength;

@end

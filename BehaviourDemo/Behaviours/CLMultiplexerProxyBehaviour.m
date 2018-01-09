//
//  CLMultiplexerProxyBehaviour.m
//  BehaviourDemo
//
//  Created by CaryaLiu on 2018/1/6.
//  Copyright © 2018年 CaryaLiu. All rights reserved.
//

#import "CLMultiplexerProxyBehaviour.h"

@implementation CLMultiplexerProxyBehaviour

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature *sig = [super methodSignatureForSelector:aSelector];
    if (!sig) {
        for (NSValue *target in _targets) {
            id obj = [target nonretainedObjectValue];
            if ((sig = [obj methodSignatureForSelector:aSelector])) {
                break;
            }
        }
    }
    return sig;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    for (NSValue *target in _targets) {
        id obj = [target nonretainedObjectValue];
        if ([obj respondsToSelector:anInvocation.selector]) {
            [anInvocation invokeWithTarget:obj];
        }
    }
}

#pragma mark -

- (BOOL)respondsToSelector:(SEL)aSelector {
    BOOL base = [super respondsToSelector:aSelector];
    if (base) {
        return base;
    }
    
    BOOL responds = NO;
    for (NSValue *target in _targets) {
        id obj = [target nonretainedObjectValue];
        if ([obj respondsToSelector:aSelector]) {
            responds = YES;
            break;
        }
    }
    return responds;
}

#pragma mark - properties

- (NSArray *)targets {
    NSMutableArray *mutableResult = @[].mutableCopy;
    for (NSValue *target in _targets) {
        [mutableResult addObject:[target nonretainedObjectValue]];
    }
    return mutableResult.copy;
}

- (void)setTargets:(NSArray *)targets {
    NSMutableArray *mutableResult = @[].mutableCopy;
    for (id target in targets) {
        [mutableResult addObject:[NSValue valueWithNonretainedObject:target]];
    }
    _targets = mutableResult.copy;
}
@synthesize targets = _targets;

@end

//
//  CLBehaviour.m
//  BehaviourDemo
//
//  Created by CaryaLiu on 2018/1/6.
//  Copyright © 2018年 CaryaLiu. All rights reserved.
//

#import "CLBehaviour.h"
#import "objc/runtime.h"

@interface CLBehaviour ()

- (void)cl_bindLifetimeToObject:(id)object;
- (void)cl_releaseLifetimeFromObject:(id)object;

@end

@implementation CLBehaviour

- (void)setOwner:(id)owner {
    if (_owner != owner) {
        [self cl_releaseLifetimeFromObject:_owner];
        _owner = owner;
        [self cl_bindLifetimeToObject:_owner];
    }
}

- (void)cl_bindLifetimeToObject:(id)object {
    objc_setAssociatedObject(object, (__bridge void *)self, self, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)cl_releaseLifetimeFromObject:(id)object {
    objc_setAssociatedObject(object, (__bridge void *)self, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

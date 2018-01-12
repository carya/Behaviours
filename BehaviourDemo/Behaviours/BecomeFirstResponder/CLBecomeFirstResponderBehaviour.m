//
//  CLBecomeFirstResponderBehaviour.m
//  BehaviourDemo
//
//  Created by CaryaLiu on 2018/1/11.
//  Copyright © 2018年 CaryaLiu. All rights reserved.
//

#import "CLBecomeFirstResponderBehaviour.h"

@implementation CLBecomeFirstResponderBehaviour

- (void)setFirstResponderTarget:(UIResponder *)firstResponderTarget {
    _firstResponderTarget = firstResponderTarget;
    [_firstResponderTarget becomeFirstResponder];
}

@end

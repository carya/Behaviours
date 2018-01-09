//
//  CLMultiplexerProxyBehaviour.h
//  BehaviourDemo
//
//  Created by CaryaLiu on 2018/1/6.
//  Copyright © 2018年 CaryaLiu. All rights reserved.
//

#import "CLBehaviour.h"

@interface CLMultiplexerProxyBehaviour : CLBehaviour

/** targets to propagate messages to */
@property (nonatomic, strong) IBOutletCollection(id) NSArray *targets;

@end

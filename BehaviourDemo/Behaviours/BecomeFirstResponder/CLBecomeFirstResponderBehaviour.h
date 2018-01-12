//
//  CLBecomeFirstResponderBehaviour.h
//  BehaviourDemo
//
//  Created by CaryaLiu on 2018/1/11.
//  Copyright © 2018年 CaryaLiu. All rights reserved.
//

#import "CLBehaviour.h"

@interface CLBecomeFirstResponderBehaviour : CLBehaviour

/** object which should become first responder */
@property (nonatomic, weak) IBOutlet UIResponder *firstResponderTarget;

@end

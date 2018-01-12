//
//  CLParallaxAnimationBehaviour.h
//  BehaviourDemo
//
//  Created by CaryaLiu on 2018/1/11.
//  Copyright © 2018年 CaryaLiu. All rights reserved.
//

#import "CLBehaviour.h"

@interface CLParallaxAnimationBehaviour : CLBehaviour <UIScrollViewDelegate>

/** view position to adjust */
@property (nonatomic, weak) IBOutlet UIView *targetView;
/** scroll view to follow */
@property (nonatomic, weak) IBOutlet UIScrollView *leadingScrollView;
/** offset for parallax, if set to zero it will grab initial position from targetView */
@property (nonatomic, assign) IBInspectable CGPoint parallaxOffset;
/** parallax speed multiplier in regards to leading scrollView contentOffset */
@property (nonatomic, assign) IBInspectable CGPoint parallaxSpeed;

@end

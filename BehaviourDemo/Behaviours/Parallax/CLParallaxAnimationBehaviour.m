//
//  CLParallaxAnimationBehaviour.m
//  BehaviourDemo
//
//  Created by CaryaLiu on 2018/1/11.
//  Copyright © 2018年 CaryaLiu. All rights reserved.
//

#import "CLParallaxAnimationBehaviour.h"

@interface CLParallaxAnimationBehaviour ()

@property(nonatomic, strong) UIMotionEffectGroup *parallaxMotionEffect;

@end

@implementation CLParallaxAnimationBehaviour

- (void)adjustParallaxPosition {
    BOOL initialized = NO;
    if (!initialized) {
        initialized = YES;
        if (CGPointEqualToPoint(self.parallaxOffset, CGPointZero)) {
            self.parallaxOffset = self.targetView.center;
        }
    }
    
    CGPoint center = self.leadingScrollView.contentOffset;
    center.x = self.parallaxOffset.x + center.x * self.parallaxSpeed.x;
    center.y = self.parallaxOffset.y + center.y * self.parallaxSpeed.y;
    self.targetView.center = center;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self adjustParallaxPosition];
}
@end

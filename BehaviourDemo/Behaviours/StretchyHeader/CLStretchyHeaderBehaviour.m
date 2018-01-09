//
//  CLStretchyHeaderBehaviour.m
//  BehaviourDemo
//
//  Created by CaryaLiu on 2018/1/6.
//  Copyright © 2018年 CaryaLiu. All rights reserved.
//

#import "CLStretchyHeaderBehaviour.h"

@interface CLStretchyHeaderBehaviour ()

@property(nonatomic, assign) CGPoint startContentOffset;
@property(nonatomic, assign) CGFloat bgImageHeight;

@property(nonatomic, assign) BOOL isInitialHeightSet;

@end

@implementation CLStretchyHeaderBehaviour

- (instancetype)init {
    self = [super init];
    if (self) {
        self.startContentOffset = CGPointZero;
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.startContentOffset = CGPointZero;
}

#pragma mark -

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (!_isInitialHeightSet) {
        self.bgImageHeight = CGRectGetHeight(self.backgroundView.frame);
        _isInitialHeightSet = YES;
    }
    
    CGFloat absoluteY = ABS(scrollView.contentOffset.y);
    if (scrollView.contentOffset.y <= _startContentOffset.y) {
        CGFloat diff = _startContentOffset.y - scrollView.contentOffset.y;
        
        CGFloat bgViewWidth = CGRectGetWidth(self.targetView.frame) + absoluteY;
        CGFloat bgViewHeight = self.bgImageHeight + absoluteY;
        [self.backgroundView setFrame:CGRectMake(0.0f - diff / 2.0f, CGRectGetMinY(scrollView.frame), bgViewWidth, bgViewHeight)];
        [self.targetView setFrame:CGRectMake(0.0f, CGRectGetMinY(scrollView.frame), CGRectGetWidth(self.targetView.frame), CGRectGetHeight(self.targetView.frame))];
    } else {
        if (self.scrollWithBackground) {
            [self.backgroundView setFrame:CGRectMake(0, CGRectGetMinY(scrollView.frame) - absoluteY, CGRectGetWidth(self.targetView.frame), self.bgImageHeight)];
        }
    }
}

@end

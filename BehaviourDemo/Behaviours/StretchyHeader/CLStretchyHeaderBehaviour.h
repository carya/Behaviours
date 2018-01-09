//
//  CLStretchyHeaderBehaviour.h
//  BehaviourDemo
//
//  Created by CaryaLiu on 2018/1/6.
//  Copyright © 2018年 CaryaLiu. All rights reserved.
//

#import "CLBehaviour.h"

@interface CLStretchyHeaderBehaviour : CLBehaviour <UIScrollViewDelegate>

/** Background view that will be strechted */
@property (nonatomic, weak) IBOutlet UIView *backgroundView;

/** View on scroll view we want to have strechy bg i.e. table view header */
@property (nonatomic, weak) IBOutlet UIView *targetView;

/** Scrollview we operate on */
@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;

/** Indicates whether background should go up as if it was placed on scrollview */
@property (nonatomic, assign) IBInspectable BOOL scrollWithBackground;

@end

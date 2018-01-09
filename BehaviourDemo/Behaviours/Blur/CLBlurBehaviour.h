//
//  CLBlurBehaviour.h
//  BehaviourDemo
//
//  Created by CaryaLiu on 2018/1/6.
//  Copyright © 2018年 CaryaLiu. All rights reserved.
//

#import "CLBehaviour.h"

@interface CLBlurBehaviour : CLBehaviour <UIScrollViewDelegate>

/** view we are about to blur */
@property (nonatomic, weak) IBOutlet UIView *targetView;

/** scroll view to follow */
@property (nonatomic, weak) IBOutlet UIScrollView *leadingScrollView;

/** the point where the view is fully blurred */
@property (nonatomic, assign) IBInspectable CGPoint fullBlurOffset;

/** blur radius */
@property (nonatomic, assign) IBInspectable CGFloat blurRadius;

/** make blurred snapshot */
- (IBAction)refresh;

@end

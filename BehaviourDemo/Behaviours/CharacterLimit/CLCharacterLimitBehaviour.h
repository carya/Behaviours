//
//  CLCharacterLimitBehaviour.h
//  BehaviourDemo
//
//  Created by Carya on 26/12/2017.
//  Copyright © 2017 CaryaLiu. All rights reserved.
//

#import "CLBehaviour.h"

@interface CLCharacterLimitBehaviour : CLBehaviour <UITextViewDelegate>

@property(nonatomic, weak) IBOutlet UITextView *textView;

/** label used to display number of remaining characters */
@property(nonatomic, weak) IBOutlet UILabel *counterLabel;

/** max count of characters allowed */
@property(nonatomic, assign) IBInspectable NSUInteger maxCount;

/** hide keyboard and end editing when touched return button */
@property(nonatomic, assign) BOOL hideKeyboardOnReturn;

/** end editing when touched return button */
@property(nonatomic, assign) BOOL endEditingOnReturn;

@end

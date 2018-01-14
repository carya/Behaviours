//
//  CLCharacterLimitBehaviour.m
//  BehaviourDemo
//
//  Created by Carya on 26/12/2017.
//  Copyright © 2017 CaryaLiu. All rights reserved.
//

#import "CLCharacterLimitBehaviour.h"
#import "NSString+CLEmoji.h"

@implementation CLCharacterLimitBehaviour

#pragma mark - UITextViewDelegate

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    BOOL returnKey = [text rangeOfCharacterFromSet:[NSCharacterSet newlineCharacterSet]].location != NSNotFound;
    if (returnKey && (self.hideKeyboardOnReturn || self.endEditingOnReturn)) {
        if (self.hideKeyboardOnReturn) {
            [textView resignFirstResponder];
        }
        [self sendActionsForControlEvents:UIControlEventEditingDidEnd];
        return NO;
    }
    
    NSString *modifiedText = [textView.text stringByReplacingCharactersInRange:range withString:text];
    BOOL willModifyText = modifiedText.length <= self.maxCount;
    if (willModifyText) {
        return YES;
    } else {
        NSInteger canInputLength = self.maxCount + text.length - modifiedText.length;
        if (canInputLength > 0) {  /**< 标识该次输入还可以输入的字符长度 */
            NSString *s = [text cl_truncateTailingToMaxLength:canInputLength];
            [textView setText:[textView.text stringByReplacingCharactersInRange:range withString:s]];
            [self textViewDidChange:textView];
        }
        return NO;
    }
}

- (void)textViewDidChange:(UITextView *)textView {
    [self updateCharacterLimit:textView.text];
}

#pragma mark - private methods

- (NSAttributedString *)attributedTextOfTextCount:(NSInteger)textCount {
    NSString *wordCountStr = [NSString stringWithFormat:@"%@/%@", @(textCount), @(self.maxCount)];
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:wordCountStr attributes:@{NSForegroundColorAttributeName:[UIColor colorWithWhite:68/255.0f alpha:1]}];
    NSRange wordCountRange = NSMakeRange(0, @(textCount).stringValue.length);
    [attributedText addAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithWhite:136/255.0f alpha:1]} range:wordCountRange];
    return attributedText;
}

- (void)updateCharacterLimit:(NSString *)text {
    NSInteger existTextNum = text.length;
    self.counterLabel.attributedText = [self attributedTextOfTextCount:existTextNum];
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

#pragma mark - getter & setter

- (void)setTextView:(UITextView *)textView {
    _textView = textView;
    [self updateCharacterLimit:self.textView.text];
}

- (void)setCounterLabel:(UILabel *)counterLabel {
    _counterLabel = counterLabel;
    [self updateCharacterLimit:self.textView.text];
}

@end

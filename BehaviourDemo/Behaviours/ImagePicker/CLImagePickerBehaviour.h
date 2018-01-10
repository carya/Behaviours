//
//  CLImagePickerBehaviour.h
//  BehaviourDemo
//
//  Created by CaryaLiu on 2018/1/10.
//  Copyright © 2018年 CaryaLiu. All rights reserved.
//

#import "CLBehaviour.h"

/** obviously NS_OPTIONS would be better, but it's harder to expose that in XIB */
typedef NS_ENUM(NSUInteger, CLImagePickerBehaviourSourceType) {
    CLImagePickerBehaviourSourceTypeBoth = 0,
    CLImagePickerBehaviourSourceTypeCamera,
    CLImagePickerBehaviourSourceTypeLibrary,
};

/** Generates UIControlEventValueChanged when image is selected */
@interface CLImagePickerBehaviour : CLBehaviour

/** source type to use */
@property (nonatomic, assign) IBInspectable CLImagePickerBehaviourSourceType sourceType;
/** image view to assign selected image to */
@property (nonatomic, weak) IBOutlet UIImageView *targetImageView;

- (IBAction)pickImage:(UIButton *)sender;

@end

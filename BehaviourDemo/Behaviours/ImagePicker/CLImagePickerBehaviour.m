//
//  CLImagePickerBehaviour.m
//  BehaviourDemo
//
//  Created by CaryaLiu on 2018/1/10.
//  Copyright © 2018年 CaryaLiu. All rights reserved.
//

#import "CLImagePickerBehaviour.h"

@interface CLImagePickerBehaviour () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@end

@implementation CLImagePickerBehaviour

- (IBAction)pickImage:(UIButton *)sender {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    if (self.targetImageView.image) {
        UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"Delete photo", nil) style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            self.targetImageView.image = nil;
        }];
        [alertController addAction:deleteAction];
    }
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]
        && (self.sourceType == CLImagePickerBehaviourSourceTypeBoth || self.sourceType == CLImagePickerBehaviourSourceTypeCamera)) {
        UIAlertAction *takePhotoAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"Take Photo", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
           [self showPickerWithSourceType:UIImagePickerControllerSourceTypeCamera];
        }];
        [alertController addAction:takePhotoAction];
    }
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]
        && (self.sourceType == CLImagePickerBehaviourSourceTypeBoth || self.sourceType == CLImagePickerBehaviourSourceTypeLibrary)) {
        UIAlertAction *chooseExistingAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"Choose Existing", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self showPickerWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        }];
        [alertController addAction:chooseExistingAction];
    }
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"Cancel", nil) style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertController addAction:cancelAction];
    
    NSAssert([self.owner isKindOfClass:[UIViewController class]], @"");
    [self.owner presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - UIImagePickerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    self.targetImageView.image = image;
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - private methods

- (void)showPickerWithSourceType:(UIImagePickerControllerSourceType)sourceType {
    UIImagePickerController *controller = [UIImagePickerController new];
    controller.modalPresentationStyle = UIModalPresentationCurrentContext;
    controller.sourceType = sourceType;
    controller.delegate = self;
    
    [self.owner presentViewController:controller animated:YES completion:nil];
}

@end

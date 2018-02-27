//
//  AlertController.m
//  BitcointCourseTest
//
//  Created by MacBook on 27.02.2018.
//  Copyright © 2018 AsanAmetov. All rights reserved.
//

#import "AlertController.h"
@interface AlertController ()

@end

@implementation AlertController

static UIAlertController *alertController;

+ (void)showWithTitle:(NSString*)title
              message:(NSString*)message
    cancelButtonTitle:(NSString*)cancelButtonTitle {
       alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertController addAction:cancelAction];

    [[UIApplication sharedApplication].delegate.window.rootViewController  presentViewController:alertController animated:true completion:nil];
}

+ (void)showWithTitle:(NSString*)title message:(NSString*)message {
    [self showWithTitle:title message:message cancelButtonTitle:@"OK"];
}

+ (void)showWithError:(NSError*)error {
    [AlertController showWithTitle:@"Ошибка" message:error.localizedDescription cancelButtonTitle:@"OK"];
}
@end

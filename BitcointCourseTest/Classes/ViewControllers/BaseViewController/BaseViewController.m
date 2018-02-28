//
//  BaseViewController.m
//  BitcointCourseTest
//
//  Created by Asan on 28.02.2018.
//  Copyright © 2018 AsanAmetov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import "BaseViewController.h"
#import "ErrorLoadView.h"
@interface BaseViewController()<ErrorLoadViewDelegate>
@end
@implementation BaseViewController
static UIAlertController *alertController;

- (void)showWithTitle:(NSString*)title
              message:(NSString*)message
    cancelButtonTitle:(NSString*)cancelButtonTitle {
    alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertController addAction:cancelAction];
    
    [[UIApplication sharedApplication].delegate.window.rootViewController  presentViewController:alertController animated:true completion:nil];
}
- (void)showHUD {
    [MBProgressHUD showHUDAddedTo:self.view animated:true];
}

- (void)dismissHUD {
    [MBProgressHUD hideHUDForView:self.view animated:true];
}

- (void)showWithTitle:(NSString*)title message:(NSString*)message {
    [self showWithTitle:title message:message cancelButtonTitle:@"OK"];
}

- (void)showWithError:(NSError*)error {
    [self showWithTitle:@"Ошибка" message:error.localizedDescription cancelButtonTitle:@"OK"];
}
- (void)showLoadError:(NSError*)error {
    ErrorLoadView *errorView = [[ErrorLoadView alloc] initWithError:error];
    errorView.delegate = self;
    errorView.tag = -11;
    [self.view addSubview:errorView];
}
- (void)repeatLoadData {
    [[self.view.window viewWithTag:-11] removeFromSuperview];
}
- (void)settingsHandler {
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"prefs:root=General&path=WIFI"]]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=General&path=WIFI"]];
    } else {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"App-Prefs:root=General&path=WIFI"]];
    }}
@end

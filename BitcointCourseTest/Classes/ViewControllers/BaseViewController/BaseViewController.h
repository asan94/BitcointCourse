//
//  BaseViewController.h
//  BitcointCourseTest
//
//  Created by Asan on 28.02.2018.
//  Copyright © 2018 AsanAmetov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseViewController : UIViewController
- (void)showHUD;
- (void)dismissHUD;
- (void)showWithTitle:(NSString*)title message:(NSString*)message;
- (void)showWithError:(NSError*)error;
- (void)showLoadError:(NSError*)error;
- (void)repeatLoadData;
@end

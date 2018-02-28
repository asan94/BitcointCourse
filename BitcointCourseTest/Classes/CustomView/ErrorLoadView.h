//
//  ErrorLoadView.h
//  BitcointCourseTest
//
//  Created by Asan on 28.02.2018.
//  Copyright © 2018 AsanAmetov. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ErrorLoadViewDelegate;
@interface ErrorLoadView : UIView
@property (weak, nonatomic) id<ErrorLoadViewDelegate> delegate;
- (void)showWithError:(NSError*)error;
- (instancetype)initWithError:(NSError*) error;

@end

@protocol ErrorLoadViewDelegate <NSObject>
@optional
- (void)repeatLoadData;
- (void)settingsHandler;
@end

//
//  UIView+LoadNib.h
//  BitcointCourseTest
//
//  Created by Asan on 28.02.2018.
//  Copyright © 2018 AsanAmetov. All rights reserved.
//

#import <UIKit/UIKit.h>

@import UIKit;

@protocol UIViewLoadNib <NSObject>
@optional

- (void)commonInit;

@end

@interface UIView (LoadNib) <UIViewLoadNib>

- (void)loadNib;

@end

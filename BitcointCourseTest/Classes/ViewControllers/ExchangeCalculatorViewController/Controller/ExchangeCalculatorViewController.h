//
//  ExchangeCalculatorViewController.h
//  BitcointCourseTest
//
//  Created by Asan on 28.02.2018.
//  Copyright © 2018 AsanAmetov. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ExchangeRate;
@interface ExchangeCalculatorViewController : UIViewController
- (instancetype)initWithExchangeRate: (ExchangeRate*)exchangeRate;
@end

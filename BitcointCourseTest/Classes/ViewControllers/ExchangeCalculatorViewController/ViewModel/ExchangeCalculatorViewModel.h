//
//  ExchangeCalculatorViewModel.h
//  BitcointCourseTest
//
//  Created by Asan on 28.02.2018.
//  Copyright © 2018 AsanAmetov. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ExchangeRate;
@interface ExchangeCalculatorViewModel : NSObject
@property (nonatomic, strong) NSString *firstExchangeRate;
@property (nonatomic, strong) NSString *secondExchangeRate;

- (void)setCurrentRate:(BOOL)current;
- (instancetype)initWittExchangeRate: (ExchangeRate *)exchangeRate;
- (NSString *)getScreenTitle;
- (NSString *)getExchangeCurrency;
@end

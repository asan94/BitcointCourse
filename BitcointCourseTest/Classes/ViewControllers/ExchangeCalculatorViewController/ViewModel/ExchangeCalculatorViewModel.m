//
//  ExchangeCalculatorViewModel.m
//  BitcointCourseTest
//
//  Created by Asan on 28.02.2018.
//  Copyright © 2018 AsanAmetov. All rights reserved.
//

#import "ExchangeCalculatorViewModel.h"
#import "ExchangeRate.h"
@interface ExchangeCalculatorViewModel()
@property (strong, nonatomic) ExchangeRate* exchangeRate;
@property (assign, nonatomic) BOOL current;
@end
@implementation ExchangeCalculatorViewModel
- (instancetype)initWittExchangeRate: (ExchangeRate*)exchangeRate {
    if (self = [super init]) {
        self.exchangeRate = exchangeRate;
        [self observFirstRate];
        self.current = true;
    }
    return self;
}
- (void)observFirstRate {
    [[RACObserve(self, firstExchangeRate) subscribeNext:^(id  _Nullable first) {
        self.secondExchangeRate = [NSString stringWithFormat:@"%.02f", [self getRate]];
    }] dispose];
}
- (NSString* )getScreenTitle {
    return self.exchangeRate.currencyCode;
}
- (NSString* )getExchangeCurrency {
    return self.exchangeRate.currencyCode;
}
- (void)setCurrentRate:(BOOL)current {
    self.current = current;
    self.secondExchangeRate = [NSString stringWithFormat:@"%.02f", [self getRate]];
}
- (CGFloat)getRate {
    CGFloat result = 0;
    if (self.current) {
        result = self.firstExchangeRate.floatValue * self.exchangeRate.buy;
    } else {
        result = self.firstExchangeRate.floatValue / self.exchangeRate.sell;
    }
    return result;
}
@end

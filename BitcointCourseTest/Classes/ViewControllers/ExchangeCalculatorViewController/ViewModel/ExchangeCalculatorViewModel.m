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
@end
@implementation ExchangeCalculatorViewModel
- (instancetype)initWittExchangeRate: (ExchangeRate*)exchangeRate {
    if (self = [super init]) {
        
    }
    return self;
}
@end

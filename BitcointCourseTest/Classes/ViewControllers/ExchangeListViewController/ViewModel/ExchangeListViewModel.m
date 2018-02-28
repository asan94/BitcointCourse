//
//  CoursesListViewModel.m
//  BitcointCourseTest
//
//  Created by Asan on 28.02.2018.
//  Copyright © 2018 AsanAmetov. All rights reserved.
//

#import "ExchangeListViewModel.h"
#import "ExchangeRate.h"

@interface ExchangeListViewModel()
@property (strong, nonatomic) NSArray* exchangeRates;
@end

@implementation ExchangeListViewModel
- (instancetype)init {
    if (self = [super init]) {
        self.startedUpdateContentSignal = [[RACSubject alloc] init];
        self.coursesUpdateSignal = [[RACSubject alloc] init];
        self.errorUpdateSignal = [[RACSubject alloc] init];
    }
    return self;
}
- (void)getCourses {
    [self.startedUpdateContentSignal sendNext:nil];
    [API GET:kPathCourses mappableClass:[ExchangeRate class] completion:^(id objects, NSError *error) {
        if(error != nil) {
            [self.errorUpdateSignal sendNext:error];
        } else {
            self.exchangeRates = objects;
            [self.coursesUpdateSignal sendNext:objects];
        }
    }];
}
- (NSInteger)getCoursesCount{
    return self.exchangeRates != nil ? self.exchangeRates.count: 0;
}
- (ExchangeRate*)getCoursesForIndex:(NSInteger)index {
    return self.exchangeRates[index];
}
@end

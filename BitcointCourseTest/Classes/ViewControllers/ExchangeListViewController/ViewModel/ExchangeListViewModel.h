//
//  CoursesListViewModel.h
//  BitcointCourseTest
//
//  Created by Asan on 28.02.2018.
//  Copyright © 2018 AsanAmetov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ExchangeRate;

@interface ExchangeListViewModel : NSObject
@property (nonatomic, strong, readwrite) RACSubject *startedUpdateContentSignal;
@property (nonatomic, strong, readwrite) RACSubject *coursesUpdateSignal;
@property (nonatomic, strong, readwrite) RACSubject *errorUpdateSignal;

- (void)getCourses;
- (NSInteger)getExchangeRateCount;
- (ExchangeRate*)getExchangeRateForIndex:(NSInteger)index;

@end

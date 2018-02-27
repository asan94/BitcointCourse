//
//  BitcointCourse.h
//  BitcointCourseTest
//
//  Created by MacBook on 27.02.2018.
//  Copyright © 2018 AsanAmetov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BitcointCourse : NSObject
@property (strong, nonatomic) NSString *currency;
@property (strong, nonatomic) NSString *symbol;
@property (strong, nonatomic) NSString *ask;
@property (strong, nonatomic) NSString *low;
@property (assign, nonatomic) double weighted_price;
@end

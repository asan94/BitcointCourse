//
//  BitcointCourse.h
//  BitcointCourseTest
//
//  Created by MacBook on 27.02.2018.
//  Copyright © 2018 AsanAmetov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ExchangeRate : NSObject
@property (strong, nonatomic) NSString *symbol;
@property (strong, nonatomic) NSString *currencyCode;
@property (assign, nonatomic) CGFloat last;
@property (assign, nonatomic) CGFloat sell;
@property (assign, nonatomic) CGFloat buy;
@end

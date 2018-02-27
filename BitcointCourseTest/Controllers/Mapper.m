//
//  Mapper.m
//  BitcointCourseTest
//
//  Created by MacBook on 27.02.2018.
//  Copyright © 2018 AsanAmetov. All rights reserved.
//

#import "Mapper.h"

@implementation Mapper


+ (id)map:(id)json class:(Class)cClass {
    return [[ObjectMapper sharedInstance] objectFromSource:json toInstanceOfClass:cClass];
}

@end


//
//  Error.m
//  BitcointCourseTest
//
//  Created by MacBook on 27.02.2018.
//  Copyright © 2018 AsanAmetov. All rights reserved.
//

#import "Error.h"

@implementation Error

- (instancetype)initWithJSON:(id)json {
    if (self = [super init]) {
        
    }
    return [Mapper map:json class:self.class];
}

@end


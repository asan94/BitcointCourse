//
//  Error.h
//  BitcointCourseTest
//
//  Created by MacBook on 27.02.2018.
//  Copyright © 2018 AsanAmetov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Error : NSObject

@property (assign, nonatomic) NSInteger errorCode;
@property (strong, nonatomic) NSString *errorMessage;
@property (strong, nonatomic) NSString *errorCause;

- (instancetype)initWithJSON:(id)json;

@end


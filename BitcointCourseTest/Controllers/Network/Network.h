//
//  Network.h
//  BitcointCourseTest
//
//  Created by MacBook on 27.02.2018.
//  Copyright © 2018 AsanAmetov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

typedef void (^ObjectArrayCompletionBlock)(NSArray *objects, NSError *error);

@interface Network : NSObject
+ (instancetype)sharedInstance;
- (void)GET:(NSString *)path mappableClass:(Class)cClass completion:(ObjectArrayCompletionBlock)completion;

@end

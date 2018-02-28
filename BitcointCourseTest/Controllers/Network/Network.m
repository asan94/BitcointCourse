//
//  Network.m
//  BitcointCourseTest
//
//  Created by MacBook on 27.02.2018.
//  Copyright © 2018 AsanAmetov. All rights reserved.
//

#import "Network.h"
#import "APIPath.h"
#import "ExchangeRate.h"
@interface Network()

@property (strong, nonatomic) AFHTTPSessionManager *manager;

@end
@implementation Network

static Network *network;

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        network = [[Network alloc] init];
        [network setupEnv];
    });
    return network;
}
- (void)setupEnv {
    self.manager = [[AFHTTPSessionManager alloc] initWithBaseURL: [NSURL URLWithString:kBaseUrl]];
    AFHTTPRequestSerializer *serializer = [AFHTTPRequestSerializer serializer];
    [serializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [serializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [self.manager setRequestSerializer: serializer];
}

- (void)GET:(NSString *)path mappableClass:(Class)cClass  completion:(ObjectArrayCompletionBlock)completion {
    [self.manager GET:[NSString stringWithFormat:@"%@%@", kBaseUrl, kPathCourses] parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableArray* rates = [NSMutableArray new];
        NSDictionary* json = [responseObject dictionary];
        for (NSString* key in json.allKeys) {
            //только для нашего случая
            ExchangeRate* rate = [Mapper map:json[key] class:cClass];
            rate.currencyCode = key;
            [rates addObject:rate];
        }
        completion(rates, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", [[NSString alloc] initWithData:error.userInfo[@"com.alamofire.serialization.response.error.data"] encoding:NSUTF8StringEncoding]);
        
        NSData *errorData = error.userInfo[@"com.alamofire.serialization.response.error.data"];
        
        NSError *jsonError;
        if (errorData == nil) {
            completion(nil, [NSError errorWithDomain:@"" code:-1 userInfo:@{NSLocalizedDescriptionKey : @"Нет соединения с интернетом"}]);
            return ;
        }
        id errorDict = [NSJSONSerialization JSONObjectWithData:errorData options:NSJSONReadingMutableContainers error: &jsonError];
        id obj = [Mapper map:errorDict class:cClass];
        completion(obj, nil);
        Error *err = [[Error alloc] initWithJSON: errorDict];
        if((err == nil && ![errorDict isKindOfClass:[NSDictionary class]]) || ((err.errorCode == 0 && err.errorMessage == nil && err.errorCause == nil) && ![errorDict isKindOfClass:[NSDictionary class]])){
            completion(nil, [NSError errorWithDomain:@"" code:-1 userInfo:@{NSLocalizedDescriptionKey : @"Сервер временно недоступен"}]);
            return;
        }
        NSError *e = [self processError:err];
        completion(nil, e);
    }];
}
- (id)objectWithJSON:(id)json class:(Class)cClass {
    if ([json isKindOfClass:[NSArray class]]) {
        NSMutableArray *objArray = [NSMutableArray new];
        for (id dict in json) {
            [objArray addObject:[Mapper map:dict class:cClass]];
        }
        return objArray;
    } else {
        return [Mapper map:json class:cClass];
    }
    return nil;
}
- (NSError*)processError:(Error*)err {
    NSError *error = [NSError errorWithDomain:@"com.alamofire.error.serialization.response" code:err.errorCode userInfo:@{NSLocalizedDescriptionKey : [NSString stringWithFormat:@"%@ %@", err.errorMessage, err.errorCause]}];
    
    if (error.code == 0) {
        return nil;
    }
    return  error;
}

@end

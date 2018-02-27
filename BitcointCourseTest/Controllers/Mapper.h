//
//  Mapper.h
//  BitcointCourseTest
//
//  Created by MacBook on 27.02.2018.
//  Copyright © 2018 AsanAmetov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <OCMapper/OCMapper.h>

@interface Mapper: ObjectMapper

+ (id)map:(id)json class:(Class)cClass;

@end


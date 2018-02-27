//
//  ViewController.m
//  BitcointCourseTest
//
//  Created by MacBook on 27.02.2018.
//  Copyright © 2018 AsanAmetov. All rights reserved.
//

#import "ViewController.h"
#import "BitcointCourse.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [API GET:kPathCourses mappableClass:[BitcointCourse class] completion:^(id objects, NSError *error) {
        if(error != nil) {
            
        } else {
            
        }
        
    }];    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

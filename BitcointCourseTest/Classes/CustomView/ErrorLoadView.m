//
//  ErrorLoadView.m
//  BitcointCourseTest
//
//  Created by Asan on 28.02.2018.
//  Copyright © 2018 AsanAmetov. All rights reserved.
//

#import "ErrorLoadView.h"
@interface ErrorLoadView()
@property (unsafe_unretained, nonatomic) IBOutlet UIImageView *errorImageView;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *errorDescriptionLabel;
@property (unsafe_unretained, nonatomic) IBOutlet UIButton *toSettingsButton;
@end
@implementation ErrorLoadView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self loadNib];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadNib];
    }
    return self;
}
- (instancetype)initWithError:(NSError*) error{
    self = [super init];
    if (self) {
        [self loadNib];
        self.frame = [UIScreen mainScreen].bounds;
        if (error.code == -1) {
            self.errorImageView.image = [UIImage imageNamed:@"loadErrorNetwork"];
            self.toSettingsButton.hidden = NO;
        } else {
            self.errorImageView.image = [UIImage imageNamed:@"loadError"];
            self.toSettingsButton.hidden = YES;
        }
        self.errorDescriptionLabel.text = error.localizedDescription;
    }
    return self;
}

- (IBAction)repeatHandler:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(repeatLoadData)]){
        [self.delegate repeatLoadData];
    }
}
- (IBAction)toSettingsHandle:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(settingsHandler)]){
        [self.delegate settingsHandler];
    }
}

@end

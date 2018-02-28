//
//  CoursesCell.m
//  BitcointCourseTest
//
//  Created by Asan on 28.02.2018.
//  Copyright © 2018 AsanAmetov. All rights reserved.
//

#import "ExchangeRateCell.h"
#import "ExchangeRate.h"
@interface ExchangeRateCell()
@property (weak, nonatomic) IBOutlet UILabel *currencyCodeLabel;
@property (weak, nonatomic) IBOutlet UILabel *sellLabel;
@property (weak, nonatomic) IBOutlet UILabel *buyLabel;

@end

@implementation ExchangeRateCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setupWithExchangeRate:(ExchangeRate *)course {
    self.currencyCodeLabel.text = course.currencyCode;
    self.sellLabel.text = [NSString stringWithFormat: @"%.02f %@", course.sell, course.symbol];
    self.buyLabel.text = [NSString stringWithFormat: @"%.02f %@", course.buy, course.symbol];
}
@end

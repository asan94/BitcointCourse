//
//  ExchangeCalculatorViewController.m
//  BitcointCourseTest
//
//  Created by Asan on 28.02.2018.
//  Copyright © 2018 AsanAmetov. All rights reserved.
//

#import "ExchangeCalculatorViewController.h"
#import "ExchangeCalculatorViewModel.h"
@interface ExchangeCalculatorViewController ()
@property (strong, nonatomic) ExchangeCalculatorViewModel* viewModel;
@property (weak, nonatomic) IBOutlet UILabel *firstExchangeRateLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondExchangeRateLabel;
@property (weak, nonatomic) IBOutlet UITextField *firstTextField;
@property (weak, nonatomic) IBOutlet UITextField *secondTextField;
@property (assign, nonatomic) BOOL currentCurrency;
@end

@implementation ExchangeCalculatorViewController
-  (instancetype)initWithExchangeRate: (ExchangeRate*)exchangeRate {
    self = [super init];
    if (self) {
        self.viewModel = [[ExchangeCalculatorViewModel alloc] initWittExchangeRate:exchangeRate];
        self.currentCurrency = true;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.viewModel.getScreenTitle;
    [self setupRAC];
    self.firstExchangeRateLabel.text = @"BTC";
    self.secondExchangeRateLabel.text = [self.viewModel getExchangeCurrency];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setupRAC {
    
    RAC(self.viewModel, firstExchangeRate) = [self.firstTextField.rac_textSignal distinctUntilChanged];
    [RACObserve(self.viewModel, firstExchangeRate) subscribeNext:^(NSString* first) {
        if ([first hasPrefix:@"0"]) {
            self.firstTextField.text = @"";
        }
    }];
    [RACObserve(self.viewModel, secondExchangeRate) subscribeNext:^(NSString* second) {
        self.secondTextField.text = second;
    }];
}
- (IBAction)replaceExchareHandler:(UIButton *)sender {
    self.currentCurrency = !self.currentCurrency;
    [self.viewModel setCurrentRate:self.currentCurrency];
    if (self.currentCurrency) {
        self.firstExchangeRateLabel.text = @"BTC";
        self.secondExchangeRateLabel.text = [self.viewModel getExchangeCurrency];
    } else {
        self.secondExchangeRateLabel.text = @"BTC";
        self.firstExchangeRateLabel.text = [self.viewModel getExchangeCurrency];
    }
   
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

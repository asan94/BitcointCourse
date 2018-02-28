//
//  CoursesListViewController.m
//  BitcointCourseTest
//
//  Created by Asan on 28.02.2018.
//  Copyright © 2018 AsanAmetov. All rights reserved.
//

#import "ExchangeListViewController.h"
#import "ExchangeListViewModel.h"
#import "ExchangeRateCell.h"
#import "ExchangeCalculatorViewController.h"
@interface ExchangeListViewController()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) ExchangeListViewModel *viewModel;
@end

@implementation ExchangeListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewModel = [[ExchangeListViewModel alloc] init];
    [self setupTableViewSettings];
    [self setupRAC];
    [self.viewModel getCourses];
    // Do any additional setup after loading the view from its nib.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)repeatLoadData{
    [self.viewModel getCourses];
    [super repeatLoadData];
}
- (void)setupTableViewSettings {
    [self.tableView registerNib:[UINib nibWithNibName:@"ExchangeRateCell" bundle:nil] forCellReuseIdentifier:@"ExchangeRateCell"];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 80;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}
- (void)setupRAC {
    __weak typeof(self) weakSelf = self;
    [[self.viewModel.startedUpdateContentSignal subscribeNext:^(id x) {
        [weakSelf showHUD];
    }] dispose];
    [[self.viewModel.coursesUpdateSignal subscribeNext:^(id x) {
        [weakSelf dismissHUD];
        [weakSelf.tableView reloadData];
    }] dispose];
    [[self.viewModel.errorUpdateSignal subscribeNext:^(NSError* error) {
        [weakSelf dismissHUD];
        [weakSelf showLoadError:error];
    }] dispose];
    
}

#pragma mark - UITableViewDelegate and UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.viewModel getExchangeRateCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *coursesCellIndentifier = @"ExchangeRateCell";
    ExchangeRateCell *cell = [tableView dequeueReusableCellWithIdentifier:coursesCellIndentifier];
    [cell setupWithExchangeRate:[self.viewModel getExchangeRateForIndex:indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    ExchangeCalculatorViewController* exchangeCalculatorViewController = [[ExchangeCalculatorViewController alloc] initWithExchangeRate:[self.viewModel getExchangeRateForIndex:indexPath.row]];
    [self.navigationController pushViewController:exchangeCalculatorViewController animated:true];
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

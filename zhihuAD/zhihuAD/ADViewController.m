//
//  ADViewController.m
//  zhihuAD
//
//  Created by xhwl on 2018/4/25.
//  Copyright © 2018年 红蜀黍. All rights reserved.
//

#import "ADViewController.h"
#import "ADTableViewCell.h"
#import "ADModel.h"

@interface ADViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation ADViewController

static NSString *adCellID = @"ADTableViewCell";
static NSString *cellID = @"UITableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    [self.dataArray addObjectsFromArray:[ADModel getData]];
    [self.tableView reloadData];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ADModel *model = self.dataArray[indexPath.row];
    model.index = indexPath.row;
    if ([@"AD" isEqualToString:model.name]) {
        ADTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:adCellID forIndexPath:indexPath];
        cell.model = model;
        
        return cell;
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.textLabel.text = model.name;
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 180;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"scrollViewDidScroll" object:scrollView];
}
#pragma mark - Lazy
- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[ADTableViewCell class] forCellReuseIdentifier:adCellID];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 180;
        _tableView.tableFooterView = [[UIView alloc] init];
        _tableView.backgroundColor = [UIColor grayColor];
    }
    return _tableView;
}
- (NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}


@end

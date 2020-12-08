//
//  RJVerifyCodePhoneSelectView.m
//  RJAlertViewDemo
//
//  Created by TouchWorld on 2020/12/8.
//  Copyright © 2020 RJSoft. All rights reserved.
//

#import "RJVerifyCodePhoneSelectView.h"
#import "RJVerifyCodePhoneSelectCell.h"
#import <Masonry/Masonry.h>
#import "RJVerifyCodePhoneSelectTableHeaderView.h"

static NSString * const RJCellID = @"RJVerifyCodePhoneSelectCell";
static CGFloat const RJRowHeight = 40.0;
static CGFloat const RJTableHeaderViewHeight = 30.0;

@interface RJVerifyCodePhoneSelectView () <UITableViewDataSource, UITableViewDelegate>

/// tableView
@property (nonatomic, strong) UITableView *tableView;
/// tableHeaderView
@property (nonatomic, strong) RJVerifyCodePhoneSelectTableHeaderView *tableHeaderView;
/// 选中行
@property (nonatomic, assign) NSInteger selectedRow;




@end

@implementation RJVerifyCodePhoneSelectView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupInit];
    }
    return self;
}

#pragma mark - Setup Init

- (void)setupInit {
    self.backgroundColor = [UIColor redColor];
    self.selectedRow = -1;
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(0.0);
    }];
    
    [self addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
}

#pragma mark - Delegate

#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.phoneNumbers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RJVerifyCodePhoneSelectCell *cell = [tableView dequeueReusableCellWithIdentifier:RJCellID forIndexPath:indexPath];
    NSString *phoneNumber = self.phoneNumbers[indexPath.row];
    [cell loadDataWithPhoneNumber:phoneNumber hideIcon:indexPath.row != self.selectedRow separatorLineHide:indexPath.row == self.phoneNumbers.count - 1];
    return cell;
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.selectedRow = indexPath.row;
    [tableView reloadData];
}

#pragma mark - Property

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.estimatedRowHeight = 0.0;
        _tableView.estimatedSectionHeaderHeight = 0.0;
        _tableView.estimatedSectionFooterHeight = 0.0;
        _tableView.rowHeight = RJRowHeight;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.scrollEnabled = NO;
        _tableView.alwaysBounceVertical = NO;
        _tableView.tableHeaderView = self.tableHeaderView;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[RJVerifyCodePhoneSelectCell class] forCellReuseIdentifier:RJCellID];
    }
    return _tableView;
}

- (RJVerifyCodePhoneSelectTableHeaderView *)tableHeaderView {
    if (!_tableHeaderView) {
        _tableHeaderView = [[RJVerifyCodePhoneSelectTableHeaderView alloc] initWithFrame:CGRectMake(0.0, 0.0, 0.0, RJTableHeaderViewHeight)];
    }
    return _tableHeaderView;
}

- (void)setPhoneNumbers:(NSArray<NSString *> *)phoneNumbers {
    _phoneNumbers = phoneNumbers;
    self.selectedRow = -1;
    CGFloat height = phoneNumbers.count * RJRowHeight + RJTableHeaderViewHeight;
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(height);
    }];
    [self.tableView reloadData];
}

@end

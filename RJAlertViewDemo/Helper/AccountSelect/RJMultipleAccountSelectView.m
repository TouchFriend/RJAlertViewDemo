//
//  RJMultipleAccountSelectView.m
//  RJAlertViewDemo
//
//  Created by TouchWorld on 2021/1/21.
//  Copyright © 2021 RJSoft. All rights reserved.
//

#import "RJMultipleAccountSelectView.h"
#import "RJMultipleAccountSelectCell.h"
#import <Masonry/Masonry.h>
#import "RJMultipleAccountSelectTableHeaderView.h"
#import "RJAccountSelectItem.h"

static NSString * const RJCellID = @"RJMultipleAccountSelectCell";
static CGFloat const RJTableHeaderViewHeight = 40.0;

@interface RJMultipleAccountSelectView () <UITableViewDataSource, UITableViewDelegate>

/// tableView
@property (nonatomic, strong) UITableView *tableView;
/// tableHeaderView
@property (nonatomic, strong) RJMultipleAccountSelectTableHeaderView *tableHeaderView;
/// 选中行
@property (nonatomic, assign, readwrite) NSInteger selectedRow;
/// <#Desription#>
@property (nonatomic, strong) NSMutableArray<RJAccountSelectItem *> *accountInfos;


@end

@implementation RJMultipleAccountSelectView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupInit];
    }
    return self;
}

#pragma mark - Setup Init

- (void)setupInit {
    self.backgroundColor = [UIColor whiteColor];
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
    return self.accountInfos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RJMultipleAccountSelectCell *cell = [tableView dequeueReusableCellWithIdentifier:RJCellID forIndexPath:indexPath];
    RJAccountSelectItem *infoItem = self.accountInfos[indexPath.row];
    [cell loadDataWithAccount:infoItem.account hideIcon:indexPath.row != self.selectedRow separatorLineHide:indexPath.row == self.accounts.count - 1];
    return cell;
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.selectedRow = indexPath.row;
    [tableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    RJAccountSelectItem *infoItem = self.accountInfos[indexPath.row];
    return infoItem.cellHeight;
}

#pragma mark - Public Methods

- (BOOL)isSelected {
    return self.selectedRow >= 0 && self.selectedRow < self.accounts.count;
}

- (NSString *)selectedAccount {
    if (self.selectedRow < 0 || self.selectedRow >= self.accounts.count) {
        return nil;
    }
    
    return self.accounts[self.selectedRow];
}

#pragma mark - Property

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.estimatedRowHeight = 0.0;
        _tableView.estimatedSectionHeaderHeight = 0.0;
        _tableView.estimatedSectionFooterHeight = 0.0;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.scrollEnabled = NO;
        _tableView.alwaysBounceVertical = NO;
        _tableView.tableHeaderView = self.tableHeaderView;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[RJMultipleAccountSelectCell class] forCellReuseIdentifier:RJCellID];
    }
    return _tableView;
}

- (RJMultipleAccountSelectTableHeaderView *)tableHeaderView {
    if (!_tableHeaderView) {
        _tableHeaderView = [[RJMultipleAccountSelectTableHeaderView alloc] initWithFrame:CGRectMake(0.0, 0.0, 0.0, RJTableHeaderViewHeight)];
    }
    return _tableHeaderView;
}

- (void)setAccounts:(NSArray<NSString *> *)accounts {
    _accounts = accounts;
    [self.accountInfos removeAllObjects];
    
    CGFloat height = 0.0;
    for (NSString *account in accounts) {
        RJAccountSelectItem *item = [[RJAccountSelectItem alloc] init];
        item.account = account;
        CGFloat cellHeight = [RJMultipleAccountSelectCell calculateCellHeight:account];
        item.cellHeight = cellHeight;
        [self.accountInfos addObject:item];
        height += cellHeight;
    }
    self.selectedRow = -1;
    height += RJTableHeaderViewHeight;
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(height);
    }];
    [self.tableView reloadData];
}

- (NSMutableArray<RJAccountSelectItem *> *)accountInfos {
    if (!_accountInfos) {
        _accountInfos = [NSMutableArray array];
    }
    return _accountInfos;
}

- (void)setUserName:(NSString *)userName {
    _userName = userName;
    self.tableHeaderView.userName = userName;
}

@end

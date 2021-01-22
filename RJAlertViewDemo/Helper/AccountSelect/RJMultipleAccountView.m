//
//  RJMultipleAccountView.m
//  RJAlertViewDemo
//
//  Created by TouchWorld on 2021/1/21.
//  Copyright © 2021 RJSoft. All rights reserved.
//

#import "RJMultipleAccountView.h"
#import <Masonry/Masonry.h>
#import <RJKit/RJGCDTimer.h>
#import "RJMultipleAccountSelectView.h"
#import "RJProgressHUD.h"

@interface RJMultipleAccountView ()

/// 账号选择
@property (nonatomic, strong) RJMultipleAccountSelectView *selectView;
/// 账号
@property (nonatomic, strong) NSArray<NSString *> *accounts;
/// 用户名
@property (nonatomic, copy) NSString *userName;

@end

@implementation RJMultipleAccountView

#pragma mark - Init

- (instancetype)initWithAccounts:(NSArray *)accounts userName:(NSString *)userName {
    self = [super init];
    if (self) {
        self.accounts = accounts;
        self.userName = userName;
        [self setupInit];
    }
    return self;
}

#pragma mark - Setup Init

- (void)setupInit {
    self.backgroundColor = [UIColor whiteColor];
    
    if (self.accounts && self.accounts.count > 1) {
        [self addSubview:self.selectView];
        [self.selectView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self);
        }];
        self.selectView.accounts = self.accounts;
        self.selectView.userName = self.userName;
    }
}

#pragma mark - Public Methods

- (BOOL)checkDataInputCompleted {
    if (!self.selectView.isSelected) {
        [RJProgressHUD showInfoWithStatus:@"请选择需要登录的用户"];
        [RJProgressHUD dismissWithDelay:1.5];
        return NO;
    }
    return YES;
}

- (NSString *)selectedAccount {
    return self.selectView.selectedAccount;
}

- (NSInteger)accountSelectedRow {
    return self.selectView.selectedRow;
}

#pragma mark - Target



#pragma mark - Property

- (RJMultipleAccountSelectView *)selectView {
    if (!_selectView) {
        _selectView = [[RJMultipleAccountSelectView alloc] init];
    }
    return _selectView;
}
@end

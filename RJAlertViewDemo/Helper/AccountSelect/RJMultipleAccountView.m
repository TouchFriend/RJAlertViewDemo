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

/// 手机号选择
@property (nonatomic, strong) RJMultipleAccountSelectView *selectView;
/// 手机号
@property (nonatomic, strong) NSArray<NSString *> *phoneNumbers;


@end

@implementation RJMultipleAccountView

#pragma mark - Init

- (instancetype)initWithPhoneNumbers:(NSArray *)phoneNumbers {
    self = [super init];
    if (self) {
        self.phoneNumbers = phoneNumbers;
        [self setupInit];
    }
    return self;
}

#pragma mark - Setup Init

- (void)setupInit {
    self.backgroundColor = [UIColor whiteColor];
    
    UIView *lastView = self;
    if (self.phoneNumbers && self.phoneNumbers.count > 1) {
        [self addSubview:self.selectView];
        [self.selectView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self);
        }];
        self.selectView.phoneNumbers = self.phoneNumbers;
        lastView = self.selectView;
    }
}

#pragma mark - Public Methods

- (BOOL)checkDataInputCompleted {
    if (!self.selectView.isSelected) {
        [RJProgressHUD showInfoWithStatus:@"请选择手机号"];
        [RJProgressHUD dismissWithDelay:1.5];
        return NO;
    }
    return YES;
}

- (NSString *)selectedPhoneNumber {
    return self.selectView.selectedPhoneNumber;
}

- (NSInteger)phoneSelectedRow {
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

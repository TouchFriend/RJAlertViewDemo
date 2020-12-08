//
//  RJVerifyCodePhoneSelectTableHeaderView.m
//  RJAlertViewDemo
//
//  Created by TouchWorld on 2020/12/8.
//  Copyright © 2020 RJSoft. All rights reserved.
//

#import "RJVerifyCodePhoneSelectTableHeaderView.h"
#import <Masonry/Masonry.h>

@interface RJVerifyCodePhoneSelectTableHeaderView ()

/// 标题
@property (nonatomic, strong) UILabel *titleLbl;

@end

@implementation RJVerifyCodePhoneSelectTableHeaderView

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
    
    [self addSubview:self.titleLbl];
    [self.titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15.00);
        make.centerY.mas_equalTo(self);
    }];
    
}

#pragma mark - Property

- (UILabel *)titleLbl {
    if (!_titleLbl) {
        _titleLbl = [[UILabel alloc] init];
        _titleLbl.textColor = [UIColor blackColor];
        _titleLbl.font = [UIFont systemFontOfSize:15.0 weight:UIFontWeightRegular];
        _titleLbl.textAlignment = NSTextAlignmentLeft;
        _titleLbl.text = @"请选择接收验证码的手机号";
    }
    return _titleLbl;
}

@end

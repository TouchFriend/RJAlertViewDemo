//
//  RJMultipleAccountSelectTableHeaderView.m
//  RJAlertViewDemo
//
//  Created by TouchWorld on 2021/1/21.
//  Copyright © 2021 RJSoft. All rights reserved.
//

#import "RJMultipleAccountSelectTableHeaderView.h"
#import <Masonry/Masonry.h>

@interface RJMultipleAccountSelectTableHeaderView ()

/// 标题
@property (nonatomic, strong) UILabel *titleLbl;

@end

@implementation RJMultipleAccountSelectTableHeaderView

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
        make.edges.mas_equalTo(self).insets(UIEdgeInsetsMake(0.0, 15.0, 0.0, 15.0));
    }];
    
}

#pragma mark - Property

- (UILabel *)titleLbl {
    if (!_titleLbl) {
        _titleLbl = [[UILabel alloc] init];
        _titleLbl.textColor = [UIColor blackColor];
        _titleLbl.font = [UIFont systemFontOfSize:15.0 weight:UIFontWeightRegular];
        _titleLbl.textAlignment = NSTextAlignmentLeft;
        _titleLbl.numberOfLines = 2;
        _titleLbl.text = @"用户 测试2 存在多个同名账号，请选择需要登录的用户";
    }
    return _titleLbl;
}

- (void)setUserName:(NSString *)userName {
    _userName = userName;
    self.titleLbl.text = [NSString stringWithFormat:@"用户 %@ 存在多个同名账号，请选择需要登录的用户", userName];
}

@end


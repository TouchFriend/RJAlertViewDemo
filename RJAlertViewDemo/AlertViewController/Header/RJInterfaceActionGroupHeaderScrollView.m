//
//  RJInterfaceActionGroupHeaderScrollView.m
//  RJiPhoneXAdaptDemo
//
//  Created by TouchWorld on 2020/11/30.
//  Copyright © 2020 RJSoft. All rights reserved.
//

#import "RJInterfaceActionGroupHeaderScrollView.h"
#import <Masonry/Masonry.h>

@interface RJInterfaceActionGroupHeaderScrollView ()

/// 标题
@property (nonatomic, copy) NSString *title;
/// 描述
@property (nonatomic, copy) NSString *message;

/// 标题
@property (nonatomic, strong) UILabel *titleLbl;
/// 描述
@property (nonatomic, strong) UILabel *messageLbl;
/// 容器
@property (nonatomic, strong) UIView *customContentView;


@end

@implementation RJInterfaceActionGroupHeaderScrollView

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message contentView:(UIView *)contentView {
    self = [super init];
    if (self) {
        self.title = title;
        self.message = message;
        self.customContentView = contentView;
        [self setupInit];
    }
    return self;
}

#pragma mark - Setup Init

- (void)setupInit {
    self.backgroundColor = [UIColor clearColor];
    
    UIView *contentView = [[UIView alloc] init];
    [self addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
        make.size.mas_equalTo(self);
    }];
    
    UIView *lastView = contentView;
    CGFloat firstViewTop = 19.67;
    if (self.title && self.title.length > 0) {
        [contentView addSubview:self.titleLbl];
        self.titleLbl.text = self.title;
        [self.titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
            [self addTopConstraint:make lastView:lastView flag:lastView != contentView top:firstViewTop];
            make.centerX.mas_equalTo(contentView);
            make.width.mas_equalTo(contentView).mas_offset(-32.0);
            make.height.mas_equalTo(20.3333);
        }];
        lastView = self.titleLbl;
    }
    if (self.message && self.message.length > 0) {
        CGFloat CGFloatTop = lastView != contentView ? 3.67 : firstViewTop;
        [contentView addSubview:self.messageLbl];
        self.messageLbl.text = self.message;
        [self.messageLbl mas_makeConstraints:^(MASConstraintMaker *make) {
            [self addTopConstraint:make lastView:lastView flag:lastView != contentView top:CGFloatTop];
            make.centerX.mas_equalTo(contentView);
            make.width.mas_equalTo(contentView).mas_offset(-32.0);
            make.height.mas_equalTo(15.6667);
        }];
        lastView = self.messageLbl;
    }
    
    if (self.customContentView) {
        [contentView addSubview:self.customContentView];
        [self.customContentView mas_makeConstraints:^(MASConstraintMaker *make) {
            [self addTopConstraint:make lastView:lastView flag:lastView != contentView top:0.0];
            make.left.right.mas_equalTo(contentView);
        }];
        lastView = self.customContentView;
    }
    
    if (lastView != contentView) {
        CGFloat contentViewBottomOffset = (lastView == self.customContentView) ? 0 : 20.66;
        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.bottom.mas_equalTo(lastView.mas_bottom).mas_offset(contentViewBottomOffset);
        }];
    } else {
        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0.0);
        }];
    }
}

- (void)addTopConstraint:(MASConstraintMaker *)make lastView:(UIView *)lastView flag:(BOOL)flag top:(CGFloat)top {
    if (flag) {
        make.top.mas_equalTo(lastView.mas_bottom).mas_offset(top);
    } else {
        make.top.mas_equalTo(lastView.mas_top).mas_offset(top);
    }
}

#pragma mark - Property

- (UILabel *)titleLbl {
    if (!_titleLbl) {
        _titleLbl = [[UILabel alloc] init];
        _titleLbl.textColor = [UIColor blackColor];
        _titleLbl.font = [UIFont systemFontOfSize:17.0 weight:UIFontWeightBold];
        _titleLbl.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLbl;
}

- (UILabel *)messageLbl {
    if (!_messageLbl) {
        _messageLbl = [[UILabel alloc] init];
        _messageLbl.textColor = [UIColor blackColor];
        _messageLbl.font = [UIFont systemFontOfSize:13.0];
        _messageLbl.textAlignment = NSTextAlignmentCenter;
    }
    return _messageLbl;
}

@end

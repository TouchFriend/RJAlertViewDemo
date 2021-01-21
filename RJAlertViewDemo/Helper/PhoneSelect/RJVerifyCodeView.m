//
//  RJVerifyCodeView.m
//  RJAlertViewDemo
//
//  Created by TouchWorld on 2020/12/7.
//  Copyright © 2020 RJSoft. All rights reserved.
//

#import "RJVerifyCodeView.h"
#import <Masonry/Masonry.h>
#import <RJKit/RJGCDTimer.h>
#import "RJVerifyCodePhoneSelectView.h"
#import "RJProgressHUD.h"

@interface RJVerifyCodeView ()

/// 手机号选择
@property (nonatomic, strong) RJVerifyCodePhoneSelectView *selectView;
/// 验证码输入框
@property (nonatomic, strong) UITextField *codeTextF;
/// 验证码分割线
@property (nonatomic, strong) UIView *codeSeparatorLine;
/// 获取验证码按钮
@property (nonatomic, strong) UIButton *codeBtn;
/// 定时器
@property (nonatomic, strong) RJGCDTimer *timer;
/// 手机号
@property (nonatomic, strong) NSArray<NSString *> *phoneNumbers;


@end

@implementation RJVerifyCodeView

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
            make.top.left.right.mas_equalTo(self);
        }];
        self.selectView.phoneNumbers = self.phoneNumbers;
        lastView = self.selectView;
    }
    
    [self addSubview:self.codeTextF];
    [self.codeTextF mas_makeConstraints:^(MASConstraintMaker *make) {
        if (lastView == self) {
            make.top.mas_equalTo(self);
        } else {
            make.top.mas_equalTo(self.selectView.mas_bottom).mas_offset(15.0);
        }
        make.left.mas_offset(15.0);
        make.width.mas_equalTo(100.0);
        make.height.mas_equalTo(20.0);
        make.bottom.mas_equalTo(self).mas_offset(-10.0);
    }];
    
    [self addSubview:self.codeSeparatorLine];
    [self.codeSeparatorLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.codeTextF.mas_bottom).mas_offset(3.0);
        make.height.mas_equalTo(1.0);
        make.left.right.mas_equalTo(self.codeTextF);
    }];
    
    [self addSubview:self.codeBtn];
    [self.codeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.codeTextF).mas_offset(1.0);
        make.width.mas_equalTo(115.0);
        make.right.mas_equalTo(self).mas_offset(-10.0);
        make.height.mas_equalTo(30.0);
    }];
}

#pragma mark - Public Methods

- (BOOL)checkDataInputCompleted {
    if (!self.selectView.isSelected) {
        [RJProgressHUD showInfoWithStatus:@"请选择手机号"];
        [RJProgressHUD dismissWithDelay:1.5];
        return NO;
    }
    if (self.codeTextF.text.length == 0) {
        [RJProgressHUD showInfoWithStatus:@"请输入验证码"];
        [RJProgressHUD dismissWithDelay:1.5];
        return NO;
    }
    return YES;
}

- (NSString *)selectedPhoneNumber {
    return self.selectView.selectedPhoneNumber;
}

- (NSString *)getVerifyCode {
    return self.codeTextF.text;
}

#pragma mark - Target

- (void)codeBtnClick:(UIButton *)codeBtn {
    __weak typeof(self) weakSelf = self;
    [self.timer startTimerWithBeginTime:60 endTime:0 beginBlock:^{
        NSLog(@"定时器开始");
        weakSelf.codeBtn.enabled = NO;
    } progressBlock:^(NSInteger currentTime) {
        NSLog(@"时间 = %ld", currentTime);
        NSString *title = [NSString stringWithFormat:@"重新发送(%ldS)", currentTime];
        [weakSelf.codeBtn setTitle:title forState:UIControlStateNormal];
    } finishBlock:^{
        NSLog(@"倒计时结束");
        [weakSelf.codeBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
        weakSelf.codeBtn.enabled = YES;
    } stopBlock:^(NSInteger currentTime) {
        NSLog(@"定时器停止");
        [weakSelf.codeBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
        weakSelf.codeBtn.enabled = YES;
    }];
}

#pragma mark - Property

- (UITextField *)codeTextF {
    if (!_codeTextF) {
        _codeTextF = [[UITextField alloc] init];
        _codeTextF.placeholder = @"输入验证码";
        _codeTextF.font = [UIFont systemFontOfSize:16.0 weight:UIFontWeightRegular];
        _codeTextF.textAlignment = NSTextAlignmentCenter;
        _codeTextF.borderStyle = UITextBorderStyleNone;
        _codeTextF.keyboardType = UIKeyboardTypeDefault;
        _codeTextF.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _codeTextF;
}

- (UIView *)codeSeparatorLine {
    if (!_codeSeparatorLine) {
        _codeSeparatorLine = [[UIView alloc] init];
        _codeSeparatorLine.backgroundColor = [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:1.0];
    }
    return _codeSeparatorLine;
}

- (UIButton *)codeBtn {
    if (!_codeBtn) {
        _codeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_codeBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
        _codeBtn.titleLabel.font = [UIFont systemFontOfSize:16.0 weight:UIFontWeightBold];
        [_codeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_codeBtn setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
        [_codeBtn setBackgroundColor:[UIColor whiteColor]];
        [_codeBtn addTarget:self action:@selector(codeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _codeBtn;
}

- (RJGCDTimer *)timer {
    if (!_timer) {
        _timer = [[RJGCDTimer alloc] init];
    }
    return _timer;
}

- (RJVerifyCodePhoneSelectView *)selectView {
    if (!_selectView) {
        _selectView = [[RJVerifyCodePhoneSelectView alloc] init];
    }
    return _selectView;
}
@end

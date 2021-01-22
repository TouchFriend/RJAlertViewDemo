//
//  RJMultipleAccountSelectCell.m
//  RJAlertViewDemo
//
//  Created by TouchWorld on 2021/1/21.
//  Copyright © 2021 RJSoft. All rights reserved.
//

#import "RJMultipleAccountSelectCell.h"
#import <Masonry/Masonry.h>
#import "RJAlertViewGlobalConst.h"

@interface RJMultipleAccountSelectCell ()

/// 图标
@property (nonatomic, strong) UIImageView *iconImageV;
/// 标题
@property (nonatomic, strong) UILabel *titleLbl;
/// 分割线
@property (nonatomic, strong) UIView *separatorLine;


@end

@implementation RJMultipleAccountSelectCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupInit];
    }
    return self;
}

#pragma mark - Setup Init

- (void)setupInit {
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    [self.contentView addSubview:self.iconImageV];
    [self.iconImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).mas_offset(20.0);
        make.top.mas_offset(15.0);
        make.size.mas_equalTo(CGSizeMake(14.0, 9.0));
    }];
    
    [self.contentView addSubview:self.titleLbl];
    [self.titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(11.0);
        make.bottom.mas_offset(-11.0);
        make.left.mas_equalTo(self.iconImageV.mas_right).mas_offset(10.0);
        make.right.mas_lessThanOrEqualTo(self.contentView).mas_offset(-10.0);
    }];
    self.titleLbl.text = @"17746076351";
    
    [self.contentView addSubview:self.separatorLine];
    [self.separatorLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15.0);
        make.right.mas_offset(-16.0);
        make.bottom.mas_equalTo(self.contentView);
        make.height.mas_equalTo(0.5);
    }];
}

#pragma mark - Public

- (void)loadDataWithAccount:(NSString *)account hideIcon:(BOOL)hideIcon separatorLineHide:(BOOL)separatorLineHide {
    self.titleLbl.text = account;
    self.iconImageV.hidden = hideIcon;
    self.separatorLine.hidden = separatorLineHide;
}

+ (CGFloat)calculateCellHeight:(NSString *)phoneNumber {
    NSDictionary *attributes = @{
        NSFontAttributeName : [UIFont systemFontOfSize:15.0 weight:UIFontWeightRegular],
        NSForegroundColorAttributeName : [UIColor blackColor]
    };
    CGSize titleSize = [phoneNumber boundingRectWithSize:CGSizeMake(RJAlertViewControllerWidth - 54.0, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    return ceil(titleSize.height) + 22.0;
}

#pragma mark - Property

- (UIImageView *)iconImageV {
    if (!_iconImageV) {
        _iconImageV = [[UIImageView alloc] init];
        _iconImageV.image = [UIImage imageNamed:@"icon_phonenum_select"];
        _iconImageV.hidden = YES;
    }
    return _iconImageV;
}

- (UILabel *)titleLbl {
    if (!_titleLbl) {
        _titleLbl = [[UILabel alloc] init];
        _titleLbl.textColor = [UIColor blackColor];
        _titleLbl.font = [UIFont systemFontOfSize:15.0 weight:UIFontWeightRegular];
        _titleLbl.textAlignment = NSTextAlignmentLeft;
        _titleLbl.numberOfLines = 0;
    }
    return _titleLbl;
}

- (UIView *)separatorLine {
    if (!_separatorLine) {
        _separatorLine = [[UIView alloc] init];
        _separatorLine.backgroundColor = [UIColor colorWithRed:0.7 green:0.7 blue:0.7 alpha:1.0];
    }
    return _separatorLine;
}

@end


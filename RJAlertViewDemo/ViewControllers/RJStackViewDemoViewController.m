//
//  RJStackViewDemoViewController.m
//  RJiPhoneXAdaptDemo
//
//  Created by TouchWorld on 2020/11/27.
//  Copyright © 2020 RJSoft. All rights reserved.
//

#import "RJStackViewDemoViewController.h"
#import <Masonry/Masonry.h>

#define RJRandomColor [UIColor colorWithRed:arc4random_uniform(255.0) / 255.0 green:arc4random_uniform(255.0) / 255.0 blue:arc4random_uniform(255.0) / 255.0 alpha:1.0]

@interface RJStackViewDemoViewController ()

/// <#Desription#>
@property (nonatomic, weak) UIStackView *stackView;

@end

@implementation RJStackViewDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *view1 = [self tempView];
    UIView *view2 = [self tempView];
    UIView *view3 = [self tempView];
    view2.backgroundColor = [UIColor redColor];
    NSArray *views = @[view1, view2, view3];
    
    UIStackView *stackView = [[UIStackView alloc] initWithArrangedSubviews:views];
    [self.view addSubview:stackView];
    [stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.height.mas_equalTo(100.0);
        make.width.mas_equalTo(self.view).mas_offset(-50.0);
    }];
    self.stackView = stackView;
    stackView.backgroundColor = [UIColor orangeColor];
    stackView.axis = UILayoutConstraintAxisHorizontal;
    stackView.distribution = UIStackViewDistributionFill;
    stackView.alignment = UIStackViewAlignmentFill;
    stackView.spacing = 0.0;
    stackView.layoutMarginsRelativeArrangement = YES;
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(5.0);
    }];
    
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(view3);
    }];
}

- (UIView *)tempView {
    UIView *tempView = [[UIView alloc] init];
    tempView.backgroundColor = RJRandomColor;
    return tempView;
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.stackView.center = self.view.center;
    self.stackView.bounds = CGRectMake(0.0, 0.0, self.view.frame.size.width - 50.0, 100.0);
}

@end

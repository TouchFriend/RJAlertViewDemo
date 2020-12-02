//
//  RJAlertViewController.m
//  RJiPhoneXAdaptDemo
//
//  Created by TouchWorld on 2020/11/27.
//  Copyright © 2020 RJSoft. All rights reserved.
//

#import "RJAlertViewController.h"
#import "RJAlertControllerInterfaceActionGroupView.h"
#import <Masonry/Masonry.h>
#import "RJAlertViewConst.h"

@interface RJAlertViewController ()

@end

@implementation RJAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *bgView = [[UIView alloc] init];
    [self.view addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    bgView.backgroundColor = RJGrayColorAlpha(97, 0.23);
    
    RJAlertControllerInterfaceActionGroupView *actionGroupView = [[RJAlertControllerInterfaceActionGroupView alloc] init];
    [self.view addSubview:actionGroupView];
    [actionGroupView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.width.mas_equalTo(270.0);
    }];
}



@end

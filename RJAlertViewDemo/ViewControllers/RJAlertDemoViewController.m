//
//  RJAlertDemoViewController.m
//  RJiPhoneXAdaptDemo
//
//  Created by TouchWorld on 2020/11/27.
//  Copyright © 2020 RJSoft. All rights reserved.
//

#import "RJAlertDemoViewController.h"
#import "RJAlertViewController.h"
#import <Masonry/Masonry.h>

@interface RJAlertDemoViewController ()

/// <#Desription#>
@property (nonatomic, weak) UIButton *openBtn;

@end

@implementation RJAlertDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *openBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:openBtn];
    [openBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.top.mas_equalTo(self.view.mas_safeAreaLayoutGuideTop).mas_offset(250.0);
        } else {
            // Fallback on earlier versions
            make.top.mas_equalTo(self.mas_topLayoutGuideTop).mas_offset(250.0);
        }
        make.centerX.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100.0, 40.0));
    }];
    self.openBtn = openBtn;
    openBtn.backgroundColor = [UIColor orangeColor];
    [openBtn setTitle:@"打开" forState:UIControlStateNormal];
    [openBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [openBtn addTarget:self action:@selector(openBtnClick) forControlEvents:UIControlEventTouchUpInside];
    openBtn.layer.masksToBounds = YES;
    openBtn.layer.cornerRadius = 4.0;
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (!self.presentedViewController) {
//        [self openBtnClick];
    }
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
//    self.openBtn.center = self.view.center;
//    self.openBtn.bounds = CGRectMake(0.0, 0.0, 100, 40.0);
}

- (void)openBtnClick {
    [self showAlertController];
//    [self showPhoneNumberValidView];
}

- (void)showAlertController {
    RJAlertViewController *vc = [RJAlertViewController alertControllerWithTitle:@"czx" message:@"messages1"];
    RJAlertAction *item1 = [RJAlertAction actionWithTitle:@"打开" handler:^(RJAlertAction * _Nonnull action) {
        
    }];
    RJAlertAction *item2 = [RJAlertAction actionWithTitle:@"关闭" handler:^(RJAlertAction * _Nonnull action) {
        
    }];
    RJAlertAction *item3 = [RJAlertAction actionWithTitle:@"取消" handler:^(RJAlertAction * _Nonnull action) {
        
    }];
    [vc addActions:@[item1, item2, item3]];
        
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)showPhoneNumberValidView {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"title" message:@"message" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *testAction = [UIAlertAction actionWithTitle:@"haha" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *testAction1 = [UIAlertAction actionWithTitle:@"haha" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *testAction2 = [UIAlertAction actionWithTitle:@"haha" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *testAction3 = [UIAlertAction actionWithTitle:@"haha" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *testAction4 = [UIAlertAction actionWithTitle:@"haha" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *testAction5 = [UIAlertAction actionWithTitle:@"haha" style:UIAlertActionStyleDefault handler:nil];
    
    [alertController addAction:cancelAction];
    [alertController addAction:confirmAction];
    [alertController addAction:testAction];
//    [alertController addAction:testAction1];
//    [alertController addAction:testAction2];
//    [alertController addAction:testAction3];
//    [alertController addAction:testAction4];
//    [alertController addAction:testAction5];
    
//    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
//        textField.text = @"test1";
//    }];
//    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
//        textField.text = @"test2";
//    }];

//    alertController.preferredAction = confirmAction;
    [self presentViewController:alertController animated:YES completion:nil];
}

@end

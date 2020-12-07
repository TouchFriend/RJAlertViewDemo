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

@property (nonatomic, strong) NSMutableArray<RJAlertAction *> *alertActions;

@end



@implementation RJAlertViewController

@synthesize title = _title;

#pragma mark - Init

+ (instancetype)alertControllerWithTitle:(nullable NSString *)title message:(nullable NSString *)message {
    RJAlertViewController *controller = [[self alloc] init];
    controller.title = title;
    controller.message = message;
    controller.modalPresentationStyle = UIModalPresentationOverFullScreen;
    controller.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    return controller;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor clearColor];
    UIView *bgView = [[UIView alloc] init];
    [self.view addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    bgView.backgroundColor = RJGrayColorAlpha(0.0, 0.2);
    
    RJAlertControllerInterfaceActionGroupView *actionGroupView = [RJAlertControllerInterfaceActionGroupView viewWithTitle:self.title message:self.message contentView:self.contentView actions:self.alertActions];
    [self.view addSubview:actionGroupView];
    [actionGroupView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.width.mas_equalTo(270.0);
    }];
}

#pragma mark - Public

- (void)addAction:(RJAlertAction *)action {
    [self.alertActions addObject:action];
}

- (void)addActions:(NSArray<RJAlertAction *> *)actions {
    [self.alertActions addObjectsFromArray:actions];
}

#pragma mark - Property

- (NSMutableArray<RJAlertAction *> *)alertActions {
    if (!_alertActions) {
        _alertActions = [NSMutableArray array];
    }
    return _alertActions;
}

- (NSArray<RJAlertAction *> *)actions {
    return [self.alertActions copy];
}

@end

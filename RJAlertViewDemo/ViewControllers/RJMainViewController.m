//
//  RJMainViewController.m
//  RJiPhoneXAdaptDemo
//
//  Created by TouchWorld on 2020/11/24.
//  Copyright © 2020 RJSoft. All rights reserved.
//

#import "RJMainViewController.h"

@interface RJMainViewController ()
/// <#Desription#>
@property (nonatomic, weak) UIDatePicker *datePicker;

@end

@implementation RJMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    [self.view addSubview:datePicker];
    self.datePicker = datePicker;
    datePicker.datePickerMode = UIDatePickerModeDate;
    if (@available(iOS 13.4, *)) {
        datePicker.preferredDatePickerStyle = UIDatePickerStyleWheels;
    }
    datePicker.backgroundColor = [UIColor orangeColor];
    datePicker.datePickerMode = UIDatePickerModeCountDownTimer;
    //设置地区
    datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh_CN"];
    //设置时区
    datePicker.timeZone = [NSTimeZone localTimeZone];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.datePicker.center = self.view.center;
    self.datePicker.bounds = CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height * 0.5);
}

@end

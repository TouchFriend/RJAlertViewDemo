//
//  RJDeleteZeroViewController.m
//  RJAlertViewDemo
//
//  Created by TouchWorld on 2020/12/10.
//  Copyright © 2020 RJSoft. All rights reserved.
//

#import "RJDeleteZeroViewController.h"

@interface RJDeleteZeroViewController ()

@end

@implementation RJDeleteZeroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)deleteZeroTest {
    NSLog(@"%@", [self numberValueDeleteZero:12.13]);
    NSLog(@"%@", [self numberStringDeleteZero:@"1.30310000"]);
    NSLog(@"%@", [self numberStringDeleteZero:@"10.00"]);
    NSLog(@"%@", [self numberStringDeleteZero:@"100"]);
}

- (NSString *)numberValueDeleteZero:(CGFloat)originNumber {
    NSString *originString = [[NSString alloc] initWithFormat:@"%lf", originNumber];
    return [self numberStringDeleteZero:originString];
}

- (NSString *)numberStringDeleteZero:(NSString *)originString {
    if (![originString containsString:@"."]) { // 100
        return originString;
    }
    
    NSUInteger count = originString.length;
    for (NSInteger i = 0; i < count; i++) { // 去除多余的0
        if (![originString hasSuffix:@"0"]) {
            break;
        }
        
        originString = [originString substringToIndex:originString.length - 1];
    }
    if ([originString hasSuffix:@"."]) { // 处理12.
        originString = [originString substringToIndex:originString.length - 1];
    }
    return originString;
}

@end
